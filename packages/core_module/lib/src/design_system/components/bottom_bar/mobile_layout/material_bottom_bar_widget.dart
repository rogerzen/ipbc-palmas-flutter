// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart' hide BottomNavigationBar;

class MaterialBottomBarWidget extends StatefulWidget {
  final int selectedIndex;

  final Function(int) callback;

  const MaterialBottomBarWidget(
      {super.key, required this.selectedIndex, required this.callback});

  @override
  State<MaterialBottomBarWidget> createState() =>
      _MaterialBottomBarWidgetState();
}

class _MaterialBottomBarWidgetState extends State<MaterialBottomBarWidget>
    with ButtonsBarMixin {
  @override
  initState() {
    super.initState();
    buildButtonsBar();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        height: Platform.isIOS ? 90 : 56,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(22),
            topLeft: Radius.circular(22),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: const Offset(1, 2),
              spreadRadius: 3,
              blurRadius: 7,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          ),
          child: BottomNavigationBar(
            currentIndex: widget.selectedIndex,
            unselectedLabelStyle:
                AppFonts.defaultFont(fontSize: 12, fontWeight: FontWeight.w500),
            selectedLabelStyle:
                AppFonts.defaultFont(fontSize: 12, fontWeight: FontWeight.w500),
            selectedItemColor: AppColors.darkGreen,
            unselectedItemColor: AppColors.grey5,
            backgroundColor: AppColors.white,
            items: buttons,
            onTap: (newValue) {
              setState(
                () {
                  widget.callback(newValue);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
