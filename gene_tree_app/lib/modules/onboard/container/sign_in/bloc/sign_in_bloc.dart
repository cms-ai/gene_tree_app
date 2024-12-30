import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_keys.dart';
import 'package:gene_tree_app/core/utils/logger_utils.dart';
import 'package:gene_tree_app/data/models/auth/login_google_request.dart';
import 'package:gene_tree_app/data/models/auth/login_google_response.dart';
import 'package:gene_tree_app/domain/repositories/auth_repository.dart';
import 'package:gene_tree_app/domain/usecase/auth/login_google.usecase.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final AuthRepository authRepository = Modular.get();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    on<SignInEvent>((event, emit) async {
      await event.map(
        initial: (value) async {
          emit(SignInState.initial());
        },
        signInWithGoogle: (value) async {
          final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
          final GoogleSignInAuthentication? googleAuth =
              await googleUser?.authentication;

          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );

          // Sign in with Firebase
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);
          LoggerUtil.debugLog(userCredential.user.toString());

          final LoginGoogleRequest data = LoginGoogleRequest(
            email: userCredential.user?.email ?? "",
            name: userCredential.user?.displayName ?? "",
            avatarUrl: userCredential.user?.photoURL ?? "",
          );

          // Xử lý api login google
          final response = await LoginGoogleUsecase(authRepository).call(data);

          if (response != null) {
            // Lưu local data của user
            await _saveUserLocalData(response);
            // Điều hướng tới main module
            // Modular.to.navigate(MainModule.path);
          }
        },
      );
    });
  }

  Future<void> _saveUserLocalData(LoginGoogleResponse? response) async {
    await SharePreferenceKeys.token
        .saveData<String>(response?.accessToken ?? "");
    await SharePreferenceKeys.refreshToken
        .saveData<String>(response?.refreshToken ?? "");
    await SharePreferenceKeys.userId
        .saveData<String>(response?.user.userId ?? "");
  }
}
