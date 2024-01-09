import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String textLabel;
  final Function(String)? onChanged;

  const CustomPasswordField(
      {Key? key,
      required this.controller,
      required this.textLabel,
      this.onChanged})
      : super(key: key);

  @override
  CustomPasswordFieldState createState() => CustomPasswordFieldState();
}

class CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: obscure,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.textLabel,
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.secondaryGrey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: AppColors.grey8),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              obscure = !obscure;
            });
          },
          child: SizedBox(
            height: 18.95,
            width: 21.65,
            child: obscure
                ? Image.asset(
                    AppIcons.visibityOff,
                    width: 21.65,
                    height: 18.95,
                  )
                : Image.asset(
                    AppIcons.visibityOn,
                    width: 21.65,
                    height: 18.95,
                  ),
          ),
        ),
      ),
    );
  }
}
