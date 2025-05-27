import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nucs_mobile/features/academic/data/models/academic_enrollment_request.dart';
import 'package:nucs_mobile/features/academic/data/repositories/academic_repository.dart';
import 'package:nucs_mobile/features/academic/view/view_models/academic_enrollment_view_model.dart';
import 'package:nucs_mobile/utils/failure.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';

// Mock classes
class MockAcademicRepository extends Mock implements AcademicRepository {}

class MockFailure extends Mock implements Failure {}

// Test provider setup
final testAcademicRepositoryProvider = Provider<AcademicRepository>((ref) {
  throw UnimplementedError();
});

final testAcademicEnrollmentViewModelProvider =
NotifierProvider.autoDispose<AcademicEnrollmentViewModel, ViewModelState<bool>>(() {
  throw UnimplementedError();
});

void main() {
  group('AcademicEnrollmentViewModel', () {
    late MockAcademicRepository mockAcademicRepository;
    late MockFailure mockFailure;
    late ProviderContainer container;

    setUp(() {
      mockAcademicRepository = MockAcademicRepository();
      mockFailure = MockFailure();

      container = ProviderContainer(
        overrides: [
          testAcademicRepositoryProvider.overrideWithValue(mockAcademicRepository),
          testAcademicEnrollmentViewModelProvider.overrideWith(
                  () => AcademicEnrollmentViewModel(academicRepository: mockAcademicRepository)),
        ],
      );
    });

    tearDown(() {
      container.dispose();
      reset(mockAcademicRepository);
      reset(mockFailure);
    });

    group('enrollDegreeProgram', () {
      test('should set state to success when enrollment succeeds', () async {
        // Arrange
        final request = AcademicEnrollmentRequest(name: '', email: '', phone: '');
        when(() => mockAcademicRepository.enrollDegreeProgram(enrollment: request))
            .thenAnswer((_) async => const Right(true));

        final notifier = container.read(testAcademicEnrollmentViewModelProvider.notifier);

        // Act
        await notifier.enrollDegreeProgram(request);

        // Assert
        final state = container.read(testAcademicEnrollmentViewModelProvider);
        expect(state, isA<ViewModelSuccessState<bool>>());
        final successState = state as ViewModelSuccessState<bool>;
        expect(successState.data, isTrue);
      });

      test('should set state to failure when enrollment fails', () async {
        // Arrange
        final request = AcademicEnrollmentRequest(name: '', email: '', phone: '');
        when(() => mockAcademicRepository.enrollDegreeProgram(enrollment: request))
            .thenAnswer((_) async => Left(mockFailure));

        final notifier = container.read(testAcademicEnrollmentViewModelProvider.notifier);

        // Act
        await notifier.enrollDegreeProgram(request);

        // Assert
        final state = container.read(testAcademicEnrollmentViewModelProvider);
        expect(state, isA<ViewModelFailState<bool>>());
        final failState = state as ViewModelFailState<bool>;
        expect(failState.failure, equals(mockFailure));
      });
    });

    group('enrollCourse', () {
      test('should set state to success when course enrollment succeeds', () async {
        // Arrange
        final request = AcademicEnrollmentRequest(name: '', email: '', phone: '');
        when(() => mockAcademicRepository.enrollCourseProgram(enrollment: request))
            .thenAnswer((_) async => const Right(true));

        final notifier = container.read(testAcademicEnrollmentViewModelProvider.notifier);

        // Act
        await notifier.enrollCourse(request);

        // Assert
        final state = container.read(testAcademicEnrollmentViewModelProvider);
        expect(state, isA<ViewModelSuccessState<bool>>());
        final successState = state as ViewModelSuccessState<bool>;
        expect(successState.data, isTrue);
      });

      test('should set state to failure when course enrollment fails', () async {
        // Arrange
        final request = AcademicEnrollmentRequest(name: '', email: '', phone: '');
        when(() => mockAcademicRepository.enrollCourseProgram(enrollment: request))
            .thenAnswer((_) async => Left(mockFailure));

        final notifier = container.read(testAcademicEnrollmentViewModelProvider.notifier);

        // Act
        await notifier.enrollCourse(request);

        // Assert
        final state = container.read(testAcademicEnrollmentViewModelProvider);
        expect(state, isA<ViewModelFailState<bool>>());
        final failState = state as ViewModelFailState<bool>;
        expect(failState.failure, equals(mockFailure));
      });
    });
  });
}
