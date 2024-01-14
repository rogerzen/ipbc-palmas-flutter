import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

import '../components/banner_error.dart';
import '../components/email_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();

  static const String emailMock = "victor@gmail.com";
  String emailTyped = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    top: 108.11,
                    bottom: 53.89,
                  ),
                  child: Text(
                    "Redefinir senha",
                    style: AppFonts.defaultFont(
                        color: AppColors.grey10,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Insira seu e-mail ou telefone",
                    style: AppFonts.defaultFont(
                        color: AppColors.grey8,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  child: CustomEmailField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    textLabel: 'Email',
                    inputTextColor: (emailMock == emailController.text
                        ? AppColors.greenInputAccept
                        : AppColors.delete),
                    borderSideColor: emailController.text.isEmpty
                        ? AppColors.grey8
                        : (emailMock == emailController.text
                            ? AppColors.disableButton
                            : AppColors.delete),
                    controller: emailController,
                    iconPath: emailMock == emailController.text
                        ? AppIcons.emailSuccess
                        : AppIcons.emailNotValid,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: ElevatedButtonWidget(
                    action: () {
                      if (emailMock == emailController.text) {
                        // Lógica para o caso em que o email corresponde
                      } else {
                        //_showErrorDialog();
                        showCustomErrorDialog(
                          context,
                          'E-mail inválido!',
                          'Por favor, verifique seu e-mail e tente novamente.',
                        );
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    fixedSize: Size(MediaQuery.of(context).size.width, 48),
                    backgroundColor: emailMock == emailController.text
                        ? AppColors.darkGreen
                        : AppColors.disableButton,
                    shadowColor: AppColors.grey0,
                    foregroundColor: AppColors.white,
                    child: const Text(
                      "Enviar",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
