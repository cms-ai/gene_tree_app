import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/exceptions/exceptions.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/helpers/helpers.dart';
import 'package:gene_tree_app/data/models/auth/request/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/response/login_google_response.dart';
import 'package:gene_tree_app/domain/usecase/auth/login_google.usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final GoogleAuthHelper authHelper;
  final JwtHelper jwtHelper;
  final LocalStorage localStorage;
  final LoginGoogleUsecase loginGoogleUsecase;
  final GetAllClanUsecase getAllClanUsecase;
  SignInBloc({
    required this.authHelper,
    required this.jwtHelper,
    required this.localStorage,
    required this.loginGoogleUsecase,
    required this.getAllClanUsecase,
  }) : super(SignInState.initial()) {
    on<SignInEvent>((event, emit) async {
      await event.map(
        initial: (value) => _handleInitialEvent(emit),
        signInWithGoogle: (value) => _handleSignInWithGoogleEvent(emit),
        signInWithApple: (_) => _handleSignInWithAppleEvent(emit),
      );
    });
  }

  Future<void> _handleInitialEvent(Emitter<SignInState> emit) async {
    emit(SignInState.initial());
  }

  Future<void> _handleSignInWithGoogleEvent(Emitter<SignInState> emit) async {
    try {
      emit(const SignInState.loading());
      final userCredential = await authHelper.signInWithGoogle();
      LoginGoogleResponse? loginRes;
      loginRes = await loginGoogleUsecase.call(
        LoginGoogleRequest(
          email: userCredential.user?.email ?? "",
          name: userCredential.user?.displayName ?? "",
          avatarUrl: userCredential.user?.photoURL ?? "",
        ),
      );

      final userId = jwtHelper.getUserIdFromToken(loginRes?.accessToken ?? "");

      if (userId != null) {
        final clanSnap = await getAllClanUsecase.call(userId);
        await _saveUserLocalData(loginRes, userId);
        emit(
          SignInState.success(
            userId: userId,
            isCompletedProfile: clanSnap.isNotEmpty,
          ),
        );
      }
    } catch (e) {
      final errorText = await e.getMessageErr();

      // print("======= $errorText and ${e.toString()}");
      emit(SignInState.failure(
        title: "Login failed",
        content: errorText ?? "",
      ));
    }
  }

  Future<void> _handleSignInWithAppleEvent(Emitter<SignInState> emit) async {
    // TODO: Implement sign in with Apple
  }

  Future<void> _saveUserLocalData(
    LoginGoogleResponse? response,
    String userId,
  ) async {
    try {
      await localStorage.save(
          SharePreferenceKeys.token.name, response?.accessToken ?? "");
      await localStorage.save(
          SharePreferenceKeys.refreshToken.name, response?.refreshToken ?? "");

      await localStorage.save(SharePreferenceKeys.userId.name, userId);
    } catch (e) {
      throw Exception(e);
    }
  }
}
