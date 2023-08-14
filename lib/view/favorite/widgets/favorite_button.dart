import 'package:e_zone/core/utils/app_color.dart';
import 'package:e_zone/view_model/favorite_view_model.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final FavoriteViewModel favoriteViewModel;
  final int index;
  const FavoriteButton({
    super.key,
    required this.favoriteViewModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        favoriteViewModel.removeCartItem(index);
      },
      icon: const Icon(
        Icons.favorite,
        size: 30,
        color: AppColor.primaryColor,
      ),
    );
  }
}
