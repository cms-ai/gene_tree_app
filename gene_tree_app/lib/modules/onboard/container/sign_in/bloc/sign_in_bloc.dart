import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/blocs/bloc/user_bloc.dart';
import 'package:gene_tree_app/core/exceptions/exceptions.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/helpers/helpers.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/data/models/auth/request/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/response/login_google_response.dart';
import 'package:gene_tree_app/domain/usecase/auth/login_google.usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';
import 'package:gene_tree_app/modules/onboard/l10n/generated/l10n.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final GoogleAuthHelper authHelper;
  final UserBloc userBloc;
  final JwtHelper jwtHelper;
  final LocalStorage localStorage;
  final LoginGoogleUsecase loginGoogleUsecase;
  final GetAllClanUsecase getAllClanUsecase;
  SignInBloc({
    required this.authHelper,
    required this.userBloc,
    required this.jwtHelper,
    required this.localStorage,
    required this.loginGoogleUsecase,
    required this.getAllClanUsecase,
  }) : super(SignInState.initial()) {
    on<SignInEvent>((event, emit) async {
      await event.map(
        signInWithGoogle: (_) async => _loginGoogleEvent(emit),
        signInWithApple: (_) async => {
          // TODO: Sign in with apple
        },
        completeProfileEvent: (value) async {},
      );
    });
  }

  Future<void> _loginGoogleEvent(Emitter<SignInState> emit) async { 
    try {
      // Login google with google plugin
      final userCre = await authHelper.signInWithGoogle();
      LoggerUtil.errorLog("UserCredential: ${userCre.user?.email}");
      // Get id token from user
      final idToken = await userCre.user?.getIdToken(true);

      if (idToken != null) {
        // Call login google usecase
        final response =
            await loginGoogleUsecase.call(LoginGoogleRequest(idToken: idToken));
        if (response?.user.userId != null &&
            response?.user.isDeleted == false) {
          await _saveUserLocalData(response);
          final completer = Completer();
          final subscription = userBloc.stream.listen((state) {
            if (state.userData != null) {
              completer.complete(); // Khi có dữ liệu user thì hoàn thành
            }
          });
          userBloc.add(const UserEvent.initialData());
          await completer.future.timeout(const Duration(seconds: 10)); // Đợi UserBloc xử lý xong
          subscription.cancel();
          emit(
            SignInState.success(userId: response!.user.userId!),
          );
        } else {
          throw Exception("User id not found");
        }
      }
    } catch (e) {
      final errorText = await e.getMessageErr();
      LoggerUtil.errorLog(
          "${OnboardLocalizations.current.loginFailed} $errorText");
      emit(SignInState.failure(
        title: OnboardLocalizations.current.loginFailed,
        content: errorText ?? "",
      ));
    }
  }

  Future<void> saveUserDatas() async {}

  Future<void> _saveUserLocalData(
    LoginGoogleResponse? response,
  ) async {
    try {
      await localStorage.save(
          SharePreferenceKeys.token.name, response?.accessToken ?? "");
      await localStorage.save(
          SharePreferenceKeys.refreshToken.name, response?.refreshToken ?? "");

      await localStorage.save(
          SharePreferenceKeys.userId.name, response?.user.userId ?? "");
    } catch (e) {
      throw Exception(e);
    }
  }
}
