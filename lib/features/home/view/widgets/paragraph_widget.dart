import 'package:flutter/material.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

class ParagraphWidget extends StatelessWidget {
  final String title;
  final String body;
  const ParagraphWidget({super.key,required this.title,required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppDimension.paddingS, 
      children: [
        Text(title,style: context.textTheme().bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        Text(body,style: context.textTheme().bodyMedium,textAlign: TextAlign.start)
        ]
      );
  }
}
