import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nucs_mobile/features/club/data/models/club_request.dart';
import 'package:nucs_mobile/features/club/data/repository/club_repository.dart';
import 'package:nucs_mobile/features/club/views/view_models/club_enrollment_view_model.dart';
import 'package:nucs_mobile/utils/failure.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';

// Mock classes
class MockClubRepository extends Mock implements ClubRepository {}

class MockFailure extends Mock implements Failure {}

// Test provider setup
final testClubRepositoryProvider = Provider<ClubRepository>((ref) {
  throw UnimplementedError();
});

final testClubEnrollmentViewModelProvider =
NotifierProvider.autoDispose<ClubEnrollmentViewModel, ViewModelState<bool>>(() {
  throw UnimplementedError();
});

void main() {
  group('ClubEnrollmentViewModel', () {
    late MockClubRepository mockClubRepository;
    late MockFailure mockFailure;
    late ProviderContainer container;

    setUp(() {
      mockClubRepository = MockClubRepository();
      mockFailure = MockFailure();

      container = ProviderContainer(
        overrides: [
          testClubRepositoryProvider.overrideWithValue(mockClubRepository),
          testClubEnrollmentViewModelProvider.overrideWith(
                  () => ClubEnrollmentViewModel(clubRepository: mockClubRepository)),
        ],
      );
    });

    tearDown(() {
      container.dispose();
      reset(mockClubRepository);
      reset(mockFailure);
    });

    group('enrollClub', () {
      test('should set state to success when enrollment succeeds', () async {
        // Arrange
        final request = ClubEnrollmentRequest(
          name: 'John Doe',
          email: 'johndoe@example.com',
          rollNumber: '12345',
        );

        when(() => mockClubRepository.enrollClub(enrollment: request))
            .thenAnswer((_) async => const Right(true));

        final notifier = container.read(testClubEnrollmentViewModelProvider.notifier);

        // Act
        await notifier.enrollClub(request);

        // Assert
        final state = container.read(testClubEnrollmentViewModelProvider);
        expect(state, isA<ViewModelSuccessState<bool>>());
        final successState = state as ViewModelSuccessState<bool>;
        expect(successState.data, isTrue);
      });

      test('should set state to failure when enrollment fails', () async {
        // Arrange
        final request = ClubEnrollmentRequest(
          name: 'John Doe',
          email: 'johndoe@example.com',
          rollNumber: '12345',
        );

        when(() => mockClubRepository.enrollClub(enrollment: request))
            .thenAnswer((_) async => Left(mockFailure));

        final notifier = container.read(testClubEnrollmentViewModelProvider.notifier);

        // Act
        await notifier.enrollClub(request);

        // Assert
        final state = container.read(testClubEnrollmentViewModelProvider);
        expect(state, isA<ViewModelFailState<bool>>());
        final failState = state as ViewModelFailState<bool>;
        expect(failState.failure, equals(mockFailure));
      });
    });
  });
}
