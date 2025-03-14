import 'package:flutter/material.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/features/home/view/widgets/feature_images_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical:AppDimension.paddingPage),
        children: [
          FeatureImagesSlider()
        ],
      )
    );
  }
}
