import 'package:flutter/material.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

class DotIndicator extends StatelessWidget {
  final int totalCount;
  final int currentIndex;
  const DotIndicator({super.key, required this.totalCount, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppDimension.paddingS,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalCount,
         (index)=>Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? context.colorScheme().primary : context.colorScheme().onSurfaceVariant
          )
         )
        ),
    );
  }
}