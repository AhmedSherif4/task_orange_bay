import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_orange_bay/app_assets/app_assets.dart';

import '../../../../core/constants/app_dimens.dart';

class FavShareWidget extends StatelessWidget {
  const FavShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: AppDimens.iconSize30,
          height: AppDimens.iconSize30,
          child: SvgPicture.asset(Assets.iconsShareOutline),
        ),
        SizedBox(
          width: AppDimens.iconSize30,
          height: AppDimens.iconSize30,
          child: SvgPicture.asset(Assets.iconsHeart),
        ),
      ],
    );
  }
}
