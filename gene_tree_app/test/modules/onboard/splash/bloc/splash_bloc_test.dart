import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/entities/user_entity.dart';
import 'package:gene_tree_app/modules/onboard/container/splash/bloc/splash_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:gene_tree_app/core/utils/databasse/share_preference_storage.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_all_clan_usecase.dart';
import 'package:gene_tree_app/domain/usecase/user/get_user.usecase.dart';

class MockLocalStorage extends Mock implements LocalStorage {}

class MockGetUserUsecase extends Mock implements GetUserUsecase {}

class MockGetAllClanUsecase extends Mock implements GetAllClanUsecase {}

void main() {
  late MockLocalStorage mockLocalStorage;
  late MockGetUserUsecase mockGetUserUsecase;
  late MockGetAllClanUsecase mockGetAllClanUsecase;
  late SplashBloc splashBloc;

  setUp(() {
    mockLocalStorage = MockLocalStorage();
    mockGetUserUsecase = MockGetUserUsecase();
    mockGetAllClanUsecase = MockGetAllClanUsecase();

    splashBloc = SplashBloc(
      localStorage: mockLocalStorage,
      getUserUsecase: mockGetUserUsecase,
      getAllClanUsecase: mockGetAllClanUsecase,
    );
  });
  tearDown(() {
    splashBloc.close(); // Đảm bảo đóng Bloc sau mỗi bài kiểm tra
  });

  group('SplashBloc', () {
    test('initial state is SplashState.initial', () {
      expect(splashBloc.state, const SplashState.initial());
    });

    blocTest<SplashBloc, SplashState>(
      'emits [unAuthenticated] when firstLogin is true',
      build: () {
        when(() => mockLocalStorage.get<bool>(any()))
            .thenAnswer((_) async => true);
        when(() => mockLocalStorage.get<String>(any()))
            .thenAnswer((_) async => '');
        when(() => mockLocalStorage.save<bool>(any(), any()))
            .thenAnswer((_) async => false);
        return splashBloc;
      },
      act: (bloc) => bloc.add(const SplashEvent.started()),
      expect: () => [
        const SplashState.unAuthenticated(firstLogin: true),
      ],
    );

    blocTest<SplashBloc, SplashState>(
      'emits [authenticated] when token and userId are valid and API calls succeed',
      build: () {
        when(() => mockLocalStorage.get<bool>(any()))
            .thenAnswer((_) async => false);
        when(() => mockLocalStorage.get<String>(SharePreferenceKeys.token.name))
            .thenAnswer((_) async => 'valid_token');
        when(() =>
                mockLocalStorage.get<String>(SharePreferenceKeys.userId.name))
            .thenAnswer((_) async => 'user_id');
        when(() => mockGetUserUsecase.call('user_id'))
            .thenAnswer((_) async => UserEntity(userId: "user_id"));
        when(() => mockGetAllClanUsecase.call('user_id')).thenAnswer(
          (_) async => [
            ClanEntity(id: "clan_id", author: UserEntity(userId: "user_id"))
          ],
        );
        return splashBloc;
      },
      act: (bloc) => bloc.add(const SplashEvent.started()),
      expect: () => [
        const SplashState.authenticated(completedUser: true),
      ],
    );

    blocTest<SplashBloc, SplashState>(
      'emits [unAuthenticated] when token or userId are invalid',
      build: () {
        when(() => mockLocalStorage.get<bool>(any()))
            .thenAnswer((_) async => false);
        when(() => mockLocalStorage.get<String>(SharePreferenceKeys.token.name))
            .thenAnswer((_) async => '');
        when(() =>
                mockLocalStorage.get<String>(SharePreferenceKeys.userId.name))
            .thenAnswer((_) async => '');
        return splashBloc;
      },
      act: (bloc) => bloc.add(const SplashEvent.started()),
      expect: () => [
        const SplashState.unAuthenticated(firstLogin: false),
      ],
    );

    blocTest<SplashBloc, SplashState>(
      'emits [unAuthenticated] when an exception occurs',
      build: () {
        when(() => mockLocalStorage.get<bool>(any()))
            .thenThrow(Exception('Error'));
        return splashBloc;
      },
      act: (bloc) => bloc.add(const SplashEvent.started()),
      expect: () => [
        const SplashState.unAuthenticated(firstLogin: false),
      ],
    );
  });
}
