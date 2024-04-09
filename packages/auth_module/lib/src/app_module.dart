import 'package:core_module/core_module.dart';
import 'package:ipbc_mobile/app/home/home_module.dart';

import 'external/hive_auth_datasource.dart';
import 'infra/repositories/auth_repository.dart';
import 'ui/stores/create_account_store.dart';
import 'ui/stores/login_store.dart';
import 'ui/stores/reset_password_store.dart';
import 'ui/views/create_account_view.dart';
import 'ui/views/creating_new_password_view.dart';
import 'ui/views/login_view.dart';
import 'ui/views/reset_password_success_view.dart';
import 'ui/views/reset_password_view.dart';
import 'ui/views/verification_code_view.dart';

class AuthModule extends Module {
  static const String authRoute = '/auth';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String createAccountRoute = '/create-account';
  static const String verificationCodeRoute = '/verification-code';
  static const String creatingNewPassWordRoute = '/creating-new-password';
  static const String resetPasswordSuccessRoute = '/success-password';
  static const String resetPasswordRoute = '/reset-password';

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.add(
      () => AuthUseCase(
        repository: AuthRepository<HiveAuthDTO>(
          datasource: HiveAuthDatasource<HiveAuthDTO>(boxLabel: 'auth'),
        ),
      ),
    );
    i.addSingleton(
      () => LoginStore(
        useCases: i.get<AuthUseCase>(),
      ),
    );
    i.addSingleton(ResetPasswordStore.new);
    i.addLazySingleton(CreateAccountStore.new);
  }

  @override
  void routes(r) {
    r.child(authRoute, child: (_) => const LoginView());
    r.module(homeRoute, module: HomeModule());
    r.child(loginRoute, child: (_) => const LoginView());
    r.child(createAccountRoute, child: (_) => const CreateAccountView());
    r.child(resetPasswordRoute, child: (_) => const ResetPasswordView());
    r.child(
      verificationCodeRoute,
      child: (_) => const VerificationCodeView(),
    );
    r.child(
      creatingNewPassWordRoute,
      child: (_) => const CreatingNewPasswordView(),
    );
    r.child(
      resetPasswordSuccessRoute,
      child: (_) => const ResetPasswordSuccessView(),
    );
  }
}
