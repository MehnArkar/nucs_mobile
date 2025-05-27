import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/features/blog/data/models/blog.dart';
import 'package:nucs_mobile/features/blog/views/view_models/blog_view_model.dart';
import 'package:nucs_mobile/features/blog/views/widgets/blog_list_item.dart';
import '../../../../core/injector.dart';
import '../../../../utils/view_model_state.dart';

final blogListViewModel = NotifierProvider<BlogListViewModel, ViewModelState<List<Blog>>>(() {
  return BlogListViewModel(blogRepository: injector.get());
});



class BlogPage extends ConsumerWidget{
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogViewModelState = ref.watch(blogListViewModel);
    return Scaffold(
      body: switch (blogViewModelState) {
        ViewModelLoadingState() => const Center(child: CircularProgressIndicator()),
        ViewModelFailState failure => Center(child: Text(failure.failure.message)),
        ViewModelSuccessState<List<Blog>> success => _buildBlogList(success.data),
        _=>SizedBox.shrink()
      },
    );
  }

  Widget _buildBlogList(List<Blog> blogs){
    return ListView.separated(
        padding: EdgeInsets.all(AppDimension.paddingPage),
        itemBuilder: (context,index)=>BlogListItem(blog: blogs[index]),
        separatorBuilder: (context,index)=>SizedBox(height: AppDimension.paddingM),
        itemCount: blogs.length);
  }
}