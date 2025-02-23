import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/data/models/auth/request/login_google_request.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:gene_tree_app/modules/onboard/container/sign_in/bloc/sign_in_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/helpers/helpers.dart';
import 'package:gene_tree_app/data/models/auth/response/login_google_response.dart';
import 'package:gene_tree_app/domain/usecase/auth/login_google.usecase.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockGoogleAuthHelper extends Mock implements GoogleAuthHelper {}

class MockJwtHelper extends Mock implements JwtHelper {}

class MockLocalStorage extends Mock implements LocalStorage {}

class MockLoginGoogleUsecase extends Mock implements LoginGoogleUsecase {}

class MockGetAllClanUsecase extends Mock implements GetAllClanUsecase {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockGoogleAuthHelper mockAuthHelper;
  late MockJwtHelper mockJwtHelper;
  late MockLocalStorage mockLocalStorage;
  late MockLoginGoogleUsecase mockLoginGoogleUsecase;
  late MockGetAllClanUsecase mockGetAllClanUsecase;
  setUpAll(() {
    SharedPreferences.setMockInitialValues({}); //set values here

    registerFallbackValue(
      /* create a dummy instance of `LoginGoogleRequest` */

      LoginGoogleRequest(),
    );
  });
  setUp(() {
    mockAuthHelper = MockGoogleAuthHelper();
    mockJwtHelper = MockJwtHelper();
    mockLocalStorage = MockLocalStorage();
    mockLoginGoogleUsecase = MockLoginGoogleUsecase();
    mockGetAllClanUsecase = MockGetAllClanUsecase();
  });

  tearDown(() {});

  group('SignInBloc', () {
    blocTest<SignInBloc, SignInState>(
      'emits [loading, success] when signInWithGoogle is successful',
      build: () {
        when(() => mockAuthHelper.signInWithGoogle()).thenAnswer((_) async {
          return MockUserCredential(); // Mock UserCredential
        });
        when(() => mockLocalStorage.save(
              SharePreferenceKeys.token.name,
              'mock_access_token',
            )).thenAnswer((_) async => true);

        when(() => mockLocalStorage.save(
              SharePreferenceKeys.refreshToken.name,
              'mock_refresh_token',
            )).thenAnswer((_) async => true);

        when(() => mockLocalStorage.save(
              SharePreferenceKeys.userId.name,
              'mock_user_id',
            )).thenAnswer((_) async => true);

        when(() => mockLoginGoogleUsecase.call(any())).thenAnswer((_) async {
          return LoginGoogleResponse(
            accessToken: 'mock_access_token',
            refreshToken: 'mock_refresh_token',
            user: UserEntity(),
          );
        });

        when(() => mockJwtHelper.getUserIdFromToken(any()))
            .thenReturn('mock_user_id');

        when(() => mockGetAllClanUsecase.call(any())).thenAnswer(
          (_) async => [
            ClanEntity(
              id: "clan_id",
              author: UserEntity(userId: "mock_user_id"),
            )
          ],
        );

        return SignInBloc(
          authHelper: mockAuthHelper,
          jwtHelper: mockJwtHelper,
          localStorage: mockLocalStorage,
          loginGoogleUsecase: mockLoginGoogleUsecase,
          getAllClanUsecase: mockGetAllClanUsecase,
        );
      },
      act: (bloc) => bloc.add(const SignInEvent.signInWithGoogle()),
      expect: () => [
        const SignInState.loading(),
        const SignInState.success(
            userId: 'mock_user_id', isCompletedProfile: true),
      ],
      verify: (_) {
        verify(() => mockAuthHelper.signInWithGoogle()).called(1);
        verify(() => mockLoginGoogleUsecase.call(any())).called(1);
        verify(() => mockJwtHelper.getUserIdFromToken(any())).called(1);
        verify(() => mockGetAllClanUsecase.call(any())).called(1);
      },
    );

    blocTest<SignInBloc, SignInState>(
      'emits [loading, failure] when signInWithGoogle fails',
      build: () {
        when(() => mockAuthHelper.signInWithGoogle())
            .thenThrow(Exception('Login Failed 1'));

        return SignInBloc(
          authHelper: mockAuthHelper,
          jwtHelper: mockJwtHelper,
          localStorage: mockLocalStorage,
          loginGoogleUsecase: mockLoginGoogleUsecase,
          getAllClanUsecase: mockGetAllClanUsecase,
        );
      },
      act: (bloc) => bloc.add(const SignInEvent.signInWithGoogle()),
      expect: () => [
        const SignInState.loading(),
        const SignInState.failure(
          title: 'Login failed',
          content: 'Login Failed 1',
        ),
      ],
      verify: (_) {
        verify(() => mockAuthHelper.signInWithGoogle()).called(1);
      },
    );
  });
}
