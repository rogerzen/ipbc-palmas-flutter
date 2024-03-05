import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

import '../components/email_field_widget.dart';
import '../view_models/password_view_model.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final emailcontroller = Modular.get<PasswordViewModel>();

  static const String emailMock = "victor@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: context.mediaQuery.size.width,
            child: Container(
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 33),
                        child: BackButtonWidget(
                          action: () => Modular.to.navigate(
                            AuthModule.initialRoute,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                    child: EmailFieldWidget(
                      onChanged: (value) {
                        setState(() {
                          emailcontroller.setValueEmail(value);
                        });
                      },
                      textLabel: 'Email',
                      inputTextColor: (emailMock ==
                              emailcontroller.resetPasswordControllerValue
                          ? AppColors.greenInputAccept
                          : AppColors.delete),
                      borderSideColor: emailcontroller
                              .resetPasswordControllerValue.isEmpty
                          ? AppColors.grey8
                          : (emailMock ==
                                  emailcontroller.resetPasswordControllerValue
                              ? AppColors.disableButton
                              : AppColors.delete),
                      controller: emailcontroller.resetPasswordController,
                      iconPath: emailMock ==
                              emailcontroller.resetPasswordControllerValue
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
                        if (emailMock ==
                            emailcontroller.resetPasswordControllerValue) {
                          Modular.to.navigate(AuthModule.initialRoute +
                              AuthModule.verificationCodeRoute);
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
                      backgroundColor: emailMock ==
                              emailcontroller.resetPasswordControllerValue
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
      ),
    );
  }
}
