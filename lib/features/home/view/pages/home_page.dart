import 'package:flutter/material.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/features/home/view/widgets/feature_images_slider.dart';
import 'package:nucs_mobile/features/home/view/widgets/number_box_widget.dart';
import 'package:nucs_mobile/features/home/view/widgets/paragraph_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.symmetric(vertical: AppDimension.paddingPage),
      children: [
        FeatureImagesSlider(),
        SizedBox(height: AppDimension.paddingL),
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: AppDimension.paddingPage),
          child: ParagraphWidget(
              title: "National University of Computer Studies",
              body:"The National University of Computer Studies (NUCS) is a leading institution in Myanmar dedicated to computer science, information technology, and software engineering education. Established to nurture future technology leaders, NUCS provides high-quality academic programs, research opportunities, and industry collaborations to equip students with the skills needed for the digital era."),
        ),
        SizedBox(height: AppDimension.paddingXL),
        _countLayout(),
        SizedBox(height: AppDimension.paddingXL),
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: AppDimension.paddingPage),
          child: ParagraphWidget(
             title: "Vision",
             body: "The vision of the National University of Computer Studies (NUCS) is to be a center of excellence in computer science and information technology education, empowering students with the knowledge and skills to drive innovation, advance research, and contribute to the digital transformation of Myanmar and the global tech industry."
            )
        ),
        SizedBox(height: AppDimension.paddingXL),
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: AppDimension.paddingPage),
          child: ParagraphWidget(
            title: "Mission",
            body: "The mission of NUCS is to provide high-quality education, foster innovation, and develop skilled IT professionals through cutting-edge programs, research, and industry collaborations, preparing students for the evolving global technology landscape."
          ),
        )
      
      ],
    ));
  }

  Widget _countLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimension.paddingPage),
      child: Row(
        spacing: AppDimension.paddingM,
        children: [
            Expanded(child: NumberBoxWidget(number: "15+", label: "Faculties")), 
            Expanded(child: NumberBoxWidget(number: "20+", label: "Courses")), 
            Expanded(child: NumberBoxWidget(number: "200+", label: "Students")), 
        ],
      ),
    );
  }
}
