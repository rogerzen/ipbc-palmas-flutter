import 'dart:io';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationButtonWidget extends StatelessWidget {
  const NavigationButtonWidget(
      {super.key, double? size, this.color, required this.iconName})
      : size = size ?? 23.0;

  final double? size;
  final Color? color;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 0 : 1.5, top: 0),
      child: SizedBox(
        width: size,
        height: size,
        child: SvgPicture.asset(
          colorFilter: ColorFilter.mode(
            color ?? AppColors.darkGreen, BlendMode.srcIn,),
          iconName,
          matchTextDirection: true,
        ),
      ),
    );
  }
}
