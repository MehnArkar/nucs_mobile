import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nucs_mobile/features/academic/data/models/course.dart';
import 'package:nucs_mobile/features/academic/data/repositories/academic_repository.dart';
import 'package:nucs_mobile/features/academic/view/view_models/course_list_view_model.dart';
import 'package:nucs_mobile/utils/failure.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';

// Mock classes
class MockAcademicRepository extends Mock implements AcademicRepository {}

class MockFailure extends Mock implements Failure {}

// Create a provider for testing
final testAcademicRepositoryProvider = Provider<AcademicRepository>((ref) {
  throw UnimplementedError();
});

final testCourseListViewModelProvider = NotifierProvider<CourseListViewModel, ViewModelState<List<Course>>>(() {
  throw UnimplementedError();
});

void main() {
  group('CourseListViewModel', () {
    late MockAcademicRepository mockAcademicRepository;
    late MockFailure mockFailure;
    late ProviderContainer container;

    setUp(() {
      mockAcademicRepository = MockAcademicRepository();
      mockFailure = MockFailure();

      container = ProviderContainer(
        overrides: [
          testAcademicRepositoryProvider.overrideWithValue(mockAcademicRepository),
          testCourseListViewModelProvider.overrideWith(() =>
              CourseListViewModel(academicRepository: mockAcademicRepository)),
        ],
      );
    });

    tearDown(() {
      container.dispose();
      reset(mockAcademicRepository);
      reset(mockFailure);
    });


    group('getCourses', () {

      test('should set state to success when repository returns courses', () async {
        // Arrange
        final mockCourses = [
          Course(
            id: '1',
            title: 'Introduction to Computer Science',
           image: '',
            description: 'Basic computer science concepts',
          ),
          Course(
            id: '2',
            title: 'Data Structures',
            image: "",
            description: 'Learn about data structures',
          ),
        ];

        when(() => mockAcademicRepository.getCourses())
            .thenAnswer((_) async => Right(mockCourses));

        final notifier = container.read(testCourseListViewModelProvider.notifier);

        // Act
        await notifier.getCourses();

        // Assert
        final state = container.read(testCourseListViewModelProvider);
        expect(state, isA<ViewModelSuccessState<List<Course>>>());
        final successState = state as ViewModelSuccessState<List<Course>>;
        expect(successState.data, equals(mockCourses));
        expect(successState.data.length, equals(2));
        expect(successState.data.first.title, equals('Introduction to Computer Science'));
      });

      test('should set state to failure when repository returns error', () async {
        // Arrange
        when(() => mockAcademicRepository.getCourses())
            .thenAnswer((_) async => Left(mockFailure));

        final notifier = container.read(testCourseListViewModelProvider.notifier);

        // Act
        await notifier.getCourses();

        // Assert
        final state = container.read(testCourseListViewModelProvider);
        expect(state, isA<ViewModelFailState<List<Course>>>());
        final failState = state as ViewModelFailState<List<Course>>;
        expect(failState.failure, equals(mockFailure));
      });

      test('should set state to success with empty list when no courses', () async {
        // Arrange
        when(() => mockAcademicRepository.getCourses())
            .thenAnswer((_) async => const Right([]));

        final notifier = container.read(testCourseListViewModelProvider.notifier);

        // Act
        await notifier.getCourses();

        // Assert
        final state = container.read(testCourseListViewModelProvider);
        expect(state, isA<ViewModelSuccessState<List<Course>>>());
        final successState = state as ViewModelSuccessState<List<Course>>;
        expect(successState.data, isEmpty);
      });

    });

  });
}