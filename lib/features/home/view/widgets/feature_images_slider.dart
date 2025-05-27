import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/features/home/view/widgets/dot_indicator.dart';

final imagesSliderIndexProvider = StateProvider<int>((ref) => 0);

class FeatureImagesSlider extends ConsumerWidget {
  const FeatureImagesSlider({super.key});
  static const List<String> images = [
    "https://nucs-edu.org/wp-content/uploads/2025/05/Screenshot-2024-10-08-101428.png",
    "https://nucs-edu.org/wp-content/uploads/2025/05/Screenshot-2024-10-08-101428.png",
    "https://nucs-edu.org/wp-content/uploads/2025/05/Screenshot-2024-10-08-101428.png"
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(imagesSliderIndexProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildImageSlider(context,ref),
        SizedBox(height: AppDimension.paddingM),
        DotIndicator(
          totalCount: images.length,
          currentIndex: currentIndex
        )
      
      ],
    );
  }

  Widget _buildImageSlider(BuildContext context,WidgetRef ref){
    return CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, _) => ref.read(imagesSliderIndexProvider.notifier).state = index,
              aspectRatio: 16 / 8),
          items: images
              .map((image) => _ImageSliderItem(imageUrl: image))
              .toList(),
        );
  }
}


class _ImageSliderItem extends StatelessWidget {
  final String imageUrl;
  const _ImageSliderItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimension.borderRadius),
                    child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        width: double.maxFinite,
                        height: double.maxFinite,
                        fit: BoxFit.cover),
                  );
  }
}

