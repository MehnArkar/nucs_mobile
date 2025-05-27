import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nucs_mobile/features/club/data/models/club.dart';
import 'package:nucs_mobile/features/club/data/repository/club_repository.dart';
import 'package:nucs_mobile/features/club/views/view_models/club_list_view_model.dart';
import 'package:nucs_mobile/utils/failure.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';

// Mock classes
class MockClubRepository extends Mock implements ClubRepository {}

class MockFailure extends Mock implements Failure {}

// Test provider setup
final testClubRepositoryProvider = Provider<ClubRepository>((ref) {
  throw UnimplementedError();
});

final testClubListViewModelProvider =
NotifierProvider<ClubListViewModel, ViewModelState<List<Club>>>(() {
  throw UnimplementedError();
});

void main() {
  group('ClubListViewModel', () {
    late MockClubRepository mockClubRepository;
    late MockFailure mockFailure;
    late ProviderContainer container;

    setUp(() {
      mockClubRepository = MockClubRepository();
      mockFailure = MockFailure();

      container = ProviderContainer(
        overrides: [
          testClubRepositoryProvider.overrideWithValue(mockClubRepository),
          testClubListViewModelProvider.overrideWith(
                  () => ClubListViewModel(blogRepository: mockClubRepository)),
        ],
      );
    });

    tearDown(() {
      container.dispose();
      reset(mockClubRepository);
      reset(mockFailure);
    });

    group('getClubs', () {
      test('should set state to success when repository returns clubs', () async {
        // Arrange
        final mockClubs = [
          Club(
            id: '1',
            title: 'Photography Club',
            description: 'A club for photography enthusiasts',
            image: 'photo_club.png',
            members: 50,
          ),
          Club(
            id: '2',
            title: 'Robotics Club',
            description: 'A club focused on robotics and engineering',
            image: 'robotics_club.png',
            members: 30,
          ),
        ];

        when(() => mockClubRepository.getClubs())
            .thenAnswer((_) async => Right(mockClubs));

        final notifier = container.read(testClubListViewModelProvider.notifier);

        // Act
        await notifier.getClubs();

        // Assert
        final state = container.read(testClubListViewModelProvider);
        expect(state, isA<ViewModelSuccessState<List<Club>>>());
        final successState = state as ViewModelSuccessState<List<Club>>;
        expect(successState.data, equals(mockClubs));
        expect(successState.data.length, equals(2));
        expect(successState.data.first.title, equals('Photography Club'));
      });

      test('should set state to failure when repository returns error', () async {
        // Arrange
        when(() => mockClubRepository.getClubs())
            .thenAnswer((_) async => Left(mockFailure));

        final notifier = container.read(testClubListViewModelProvider.notifier);

        // Act
        await notifier.getClubs();

        // Assert
        final state = container.read(testClubListViewModelProvider);
        expect(state, isA<ViewModelFailState<List<Club>>>());
        final failState = state as ViewModelFailState<List<Club>>;
        expect(failState.failure, equals(mockFailure));
      });
    });
  });
}
