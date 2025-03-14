import 'package:flutter/material.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

class NumberBoxWidget extends StatelessWidget {
  final String number;
  final String label;
  const NumberBoxWidget({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical:AppDimension.paddingS),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimension.borderRadius),
        color: context.colorScheme().primary
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(number,style: context.textTheme().bodyLarge?.copyWith(color: context.colorScheme().onPrimary,fontWeight: FontWeight.bold)),
          Text(label,style: context.textTheme().bodyLarge?.copyWith(color: context.colorScheme().onPrimary,fontWeight: FontWeight.bold)),
        ],
      ),
    ); 
  }
}
