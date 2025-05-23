import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/config/routing/app_routes.dart';
import 'package:nucs_mobile/core/injector.dart';
import 'package:nucs_mobile/features/academic/data/models/degree_program.dart';
import 'package:nucs_mobile/features/academic/view/view_models/course_list_view_model.dart';
import 'package:nucs_mobile/features/academic/view/view_models/degree_list_view_model.dart';
import 'package:nucs_mobile/features/academic/view/widgets/academic_list_item.dart';
import 'package:nucs_mobile/utils/view_model_state.dart';

import '../../data/models/course.dart';

final degreeListViewModel = NotifierProvider<DegreeListViewModel, ViewModelState<List<DegreeProgram>>>(() {
  return DegreeListViewModel(academicRepository: injector.get());
});

final courseListViewModel = NotifierProvider<CourseListViewModel, ViewModelState<List<Course>>>(() {
  return CourseListViewModel(academicRepository: injector.get());
});



class AcademicPage extends ConsumerWidget {
  const AcademicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final degreeViewModelState = ref.watch(degreeListViewModel);
    final courseViewModelState = ref.watch(courseListViewModel);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            _buildTabBar(),
            Expanded(child: _buildTabBarView(degreeViewModelState,courseViewModelState))
          ],
        )
      ),
    );
  }


  Widget _buildTabBar(){
    return TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.grey,
        tabs: [
      Tab(text: "Degree Programs"),
      Tab(text: "Short Courses")
    ]);
  }

  Widget _buildTabBarView(ViewModelState<List<DegreeProgram>> degreeVMState,ViewModelState<List<Course>> courseVMState){
    return TabBarView(
        children: [
          _degreeProgramListView(degreeVMState),
          _courseListView(courseVMState)
        ]
    );
  }

  Widget _degreeProgramListView(ViewModelState<List<DegreeProgram>> degreeVMState){
    return switch(degreeVMState){
      ViewModelLoadingState()=>Center(child: CircularProgressIndicator()),
      ViewModelSuccessState()=>ListView.separated(
          padding: EdgeInsets.all(AppDimension.paddingPage),
          itemBuilder: (context,index){
            DegreeProgram degreeProgram = degreeVMState.data[index];
            return AcademicListItem(
                title:degreeProgram.title,
                description: degreeProgram.description,
                image: degreeProgram.image,
                onclick: ()=>context.push(AppRoutes.degreeProgramDetailsPage,extra:  degreeProgram),
            );
          },
          separatorBuilder:(_,__)=> SizedBox(height: AppDimension.paddingM),
          itemCount: degreeVMState.data.length),
      _=>SizedBox.shrink()
    };
  }

  Widget _courseListView(ViewModelState<List<Course>> courseVMState){
    return switch(courseVMState){
      ViewModelLoadingState()=>Center(child: CircularProgressIndicator()),
      ViewModelSuccessState()=>ListView.separated(
          padding: EdgeInsets.all(AppDimension.paddingPage),
          itemBuilder: (context,index){
            Course course = courseVMState.data[index];
            return AcademicListItem(
              onclick: ()=>context.push(AppRoutes.courseDetailsPage,extra:  course),
                title:course.title,
                description: course.description,
                image: course.image);
          },
          separatorBuilder:(_,__)=> SizedBox(height: AppDimension.paddingM),
          itemCount: courseVMState.data.length),
      _=>SizedBox.shrink()
    };
  }
}
