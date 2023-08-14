import 'package:e_zone/core/components/custom_network_image.dart';
import 'package:e_zone/view_model/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteImage extends StatelessWidget {
  final FavoriteViewModel favoriteViewModel;
  final int index;
  const FavoriteImage({
    super.key,
    required this.favoriteViewModel, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      width: Get.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomNetworkImage(
        image: favoriteViewModel.favList[index].image.toString(),
      ),
    );
  }
}
