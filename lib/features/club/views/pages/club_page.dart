import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClubPage extends ConsumerWidget{
  const ClubPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     return Center(child: Text("Club Page"));
  }
}