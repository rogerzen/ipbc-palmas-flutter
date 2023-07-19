import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class TabButtonsWidget extends StatelessWidget {
  const TabButtonsWidget({super.key, required this.label, required this.action});
  final String label;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                (states) => AppFonts.defaultFont(fontSize: 18),
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                return states.contains(MaterialState.hovered)
                    ? AppColors.darkGreen
                    : AppColors.grey6; // Defer to the widget's default.
              }),
          overlayColor: MaterialStateColor.resolveWith((states) => Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
        ),
        child: Text(label),
        onPressed: () => action,
      ),
    );
  }
}
