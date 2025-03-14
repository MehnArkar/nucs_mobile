import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nucs_mobile/config/constants/app_dimension.dart';
import 'package:nucs_mobile/utils/extensions/context_extensions.dart';

final imagesSliderIndexProvider = StateProvider<int>((ref) => 0);

class FeatureImagesSlider extends ConsumerWidget {
  FeatureImagesSlider({super.key});
  final List<String> images = [
    "https://scontent-sin11-2.xx.fbcdn.net/v/t39.30808-6/481984713_610107528493319_3983527128358230506_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeEU6JpsjVt7pKli32eP5I1FNdAVaErJRYo10BVoSslFivZpjhjqdUoW85ZdxbXCaCVel5ET60tiZWJvs3TyZoXJ&_nc_ohc=81ORPuKrCycQ7kNvgHrp7Ff&_nc_zt=23&_nc_ht=scontent-sin11-2.xx&_nc_gid=nVC4UPYdSd5iJriNQwRzxw&oh=00_AYF80TxKQTrI_vo0Su0S_MKgCn_9Bt7dzvTo4Bepg4JqGA&oe=67DA0AFB",
    "https://scontent-sin6-3.xx.fbcdn.net/v/t39.30808-6/470219018_122128697450527580_2484147520836469940_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeEdBnoei8I1q4bkIhjI82Q2NJjE5JeTHjw0mMTkl5MePMvVrSsdUm2yzZ9kMrjqW7Z6WYqEcZzSl-OPm5_zms7O&_nc_ohc=BsOOMw63pKIQ7kNvgGVcPpa&_nc_zt=23&_nc_ht=scontent-sin6-3.xx&_nc_gid=AHREW9LWo_2Ssqu-LXdirXa&oh=00_AYERJOzRNRTQKZFcE8mH855v8M8Fe28fJfYA5qlHx_l1SQ&oe=67DA00AB",
    "https://scontent-sin2-3.xx.fbcdn.net/v/t39.30808-6/472774810_122133837440527580_8670085773142814921_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeGBCpvCLMko87vYVQRZZuBr-R7FBGFl9cv5HsUEYWX1y03l1iqnXkDINkbkEMpi27jLHWejauAAr51NFZ5cqQyV&_nc_ohc=FwsQCtqHCBEQ7kNvgGdgrQT&_nc_zt=23&_nc_ht=scontent-sin2-3.xx&_nc_gid=3_HX0aQYJMHtpRrJ1c1Nzg&oh=00_AYEM5VNqhqGVbwizJ3ve8VzVnWLOy-IBuDBRYG5vg3nYpw&oe=67D9E705"
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(imagesSliderIndexProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, _) => ref.read(imagesSliderIndexProvider.notifier).state = index,
              aspectRatio: 16 / 8),
          items: images
              .map((image) => ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimension.borderRadius),
                    child: CachedNetworkImage(
                        imageUrl: image,
                        width: double.maxFinite,
                        height: double.maxFinite,
                        fit: BoxFit.cover),
                  ))
              .toList(),
        ),
        SizedBox(height: AppDimension.paddingM),
        DotIndicator(
          totalCount: images.length,
           currentIndex: currentIndex
           )
      
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  final int totalCount;
  final int currentIndex;
  const DotIndicator(
      {super.key, required this.totalCount, required this.currentIndex});

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
