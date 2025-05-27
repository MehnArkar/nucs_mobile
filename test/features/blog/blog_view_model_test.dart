import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nucs_mobile/features/blog/data/models/blog.dart';
import 'package:nucs_mobile/features/blog/data/repository/blog_repository.dart';
import 'package:nucs_mobile/features/blog/views/view_models/blog_view_model.dart';
import 'package:nucs_mobile/utils/failure.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';

// Mock classes
class MockBlogRepository extends Mock implements BlogRepository {}

class MockFailure extends Mock implements Failure {}

// Test provider setup
final testBlogRepositoryProvider = Provider<BlogRepository>((ref) {
  throw UnimplementedError();
});

final testBlogListViewModelProvider =
NotifierProvider<BlogListViewModel, ViewModelState<List<Blog>>>(() {
  throw UnimplementedError();
});

void main() {
  group('BlogListViewModel', () {
    late MockBlogRepository mockBlogRepository;
    late MockFailure mockFailure;
    late ProviderContainer container;

    setUp(() {
      mockBlogRepository = MockBlogRepository();
      mockFailure = MockFailure();

      container = ProviderContainer(
        overrides: [
          testBlogRepositoryProvider.overrideWithValue(mockBlogRepository),
          testBlogListViewModelProvider.overrideWith(
                  () => BlogListViewModel(blogRepository: mockBlogRepository)),
        ],
      );
    });

    tearDown(() {
      container.dispose();
      reset(mockBlogRepository);
      reset(mockFailure);
    });

    group('getBlogs', () {
      test('should set state to success when repository returns blogs', () async {
        // Arrange
        final mockBlogs = [
          Blog(id: '1', title: 'Flutter Tips', description: 'Best practices for Flutter development',image: '', createdAt: ''),
          Blog(id: '2', title: 'State Management', description: 'Understanding Riverpod',image: '', createdAt: ''),
        ];

        when(() => mockBlogRepository.getBlogs())
            .thenAnswer((_) async => Right(mockBlogs));

        final notifier = container.read(testBlogListViewModelProvider.notifier);

        // Act
        await notifier.getBlogs();

        // Assert
        final state = container.read(testBlogListViewModelProvider);
        expect(state, isA<ViewModelSuccessState<List<Blog>>>());
        final successState = state as ViewModelSuccessState<List<Blog>>;
        expect(successState.data, equals(mockBlogs));
        expect(successState.data.length, equals(2));
        expect(successState.data.first.title, equals('Flutter Tips'));
      });

      test('should set state to failure when repository returns error', () async {
        // Arrange
        when(() => mockBlogRepository.getBlogs())
            .thenAnswer((_) async => Left(mockFailure));

        final notifier = container.read(testBlogListViewModelProvider.notifier);

        // Act
        await notifier.getBlogs();

        // Assert
        final state = container.read(testBlogListViewModelProvider);
        expect(state, isA<ViewModelFailState<List<Blog>>>());
        final failState = state as ViewModelFailState<List<Blog>>;
        expect(failState.failure, equals(mockFailure));
      });
    });
  });
}
