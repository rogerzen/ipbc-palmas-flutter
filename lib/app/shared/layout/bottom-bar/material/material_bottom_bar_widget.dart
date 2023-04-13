// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart' hide BottomNavigationBar;
import '../../../configs/app_configs.dart';
import '../../../mixins/buttons_bar_mixin.dart';
import 'custom_bottom_navigation_bar.dart';

class MaterialBottomBarWidget extends StatefulWidget {
  final int selectedIndex;

  final Function(int) callback;

  const MaterialBottomBarWidget(
      {Key? key, required this.selectedIndex, required this.callback}
      ) : super(key: key);

  @override
  State<MaterialBottomBarWidget> createState() => _MaterialBottomBarWidgetState();
}

class _MaterialBottomBarWidgetState extends State<MaterialBottomBarWidget> with ButtonsBarMixin {
  @override
  initState() {
    super.initState();
    buildButtonsBar();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Container(
        height: 55,
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
            unselectedLabelStyle: AppFonts.selectedBottomNav,
            selectedLabelStyle: AppFonts.selectedBottomNav,
            selectedItemColor: AppColors.darkGreen,
            unselectedItemColor: AppColors.grey,
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
