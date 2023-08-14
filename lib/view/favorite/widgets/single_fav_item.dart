import 'package:e_zone/core/components/custom_text.dart';
import 'package:e_zone/view/favorite/widgets/fav_cart_button.dart';
import 'package:e_zone/view/favorite/widgets/favorite_button.dart';
import 'package:e_zone/view/favorite/widgets/favorite_image.dart';
import 'package:e_zone/view_model/cart_view_model.dart';
import 'package:e_zone/view_model/favorite_view_model.dart';
import 'package:flutter/material.dart';


class SingleFavItem extends StatelessWidget {
  final FavoriteViewModel favoriteViewModel;
  final CartViewModel cartViewModel;
  final int index;
  const SingleFavItem({
    super.key,
    required this.favoriteViewModel,
    required this.index,
    required this.cartViewModel,
  });

  @override
  Widget build(BuildContext context) {
    final favList=favoriteViewModel.favList[index];
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavoriteButton(
            favoriteViewModel: favoriteViewModel,
            index: index,
          ),
          FavoriteImage(
            favoriteViewModel: favoriteViewModel,
            index: index,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomText(
              text: favList.title.toString(),
              maxLines: 2,
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "\$${favList.price}",
                  size: 18,
                  color: Colors.red,
                ),
                FavCartButton(
                  cartViewModel: cartViewModel,
                  favList: favList,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
