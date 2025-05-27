import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nucs_mobile/features/academic/data/models/degree_program.dart';
import 'package:nucs_mobile/features/academic/data/repositories/academic_repository.dart';
import 'package:nucs_mobile/features/academic/view/view_models/degree_list_view_model.dart';
import 'package:nucs_mobile/utils/failure.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';

// Mock classes
class MockAcademicRepository extends Mock implements AcademicRepository {}

class MockFailure extends Mock implements Failure {}

// Test provider setup
final testAcademicRepositoryProvider = Provider<AcademicRepository>((ref) {
  throw UnimplementedError();
});

final testDegreeListViewModelProvider =
NotifierProvider<DegreeListViewModel, ViewModelState<List<DegreeProgram>>>(() {
  throw UnimplementedError();
});

void main() {
  group('DegreeListViewModel', () {
    late MockAcademicRepository mockAcademicRepository;
    late MockFailure mockFailure;
    late ProviderContainer container;

    setUp(() {
      mockAcademicRepository = MockAcademicRepository();
      mockFailure = MockFailure();

      container = ProviderContainer(
        overrides: [
          testAcademicRepositoryProvider.overrideWithValue(mockAcademicRepository),
          testDegreeListViewModelProvider.overrideWith(
                  () => DegreeListViewModel(academicRepository: mockAcademicRepository)),
        ],
      );
    });

    tearDown(() {
      container.dispose();
      reset(mockAcademicRepository);
      reset(mockFailure);
    });

    group('getDegreePrograms', () {
      test('should set state to success when repository returns degree programs', () async {
        // Arrange
        final mockPrograms = [
          DegreeProgram(id: '1', title: 'Computer Science',image: '', description: ''),
          DegreeProgram(id: '2', title: 'Mechanical Engineering',image: '', description: ''),
        ];

        when(() => mockAcademicRepository.getDegreePrograms())
            .thenAnswer((_) async => Right(mockPrograms));

        final notifier = container.read(testDegreeListViewModelProvider.notifier);

        // Act
        await notifier.getDegreePrograms();

        // Assert
        final state = container.read(testDegreeListViewModelProvider);
        expect(state, isA<ViewModelSuccessState<List<DegreeProgram>>>());
        final successState = state as ViewModelSuccessState<List<DegreeProgram>>;
        expect(successState.data, equals(mockPrograms));
        expect(successState.data.length, equals(2));
        expect(successState.data.first.title, equals('Computer Science'));
      });

      test('should set state to failure when repository returns error', () async {
        // Arrange
        when(() => mockAcademicRepository.getDegreePrograms())
            .thenAnswer((_) async => Left(mockFailure));

        final notifier = container.read(testDegreeListViewModelProvider.notifier);

        // Act
        await notifier.getDegreePrograms();

        // Assert
        final state = container.read(testDegreeListViewModelProvider);
        expect(state, isA<ViewModelFailState<List<DegreeProgram>>>());
        final failState = state as ViewModelFailState<List<DegreeProgram>>;
        expect(failState.failure, equals(mockFailure));
      });
    });
  });
}
