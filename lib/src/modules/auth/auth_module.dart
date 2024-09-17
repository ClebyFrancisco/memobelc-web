import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
// import import 'package:memobelc_front/src/modules/auth/domain/repositories/login_repository.dart';
// import import 'package:memobelc_front/src/modules/auth/domain/repositories/register_repository.dart';
// import import 'package:memobelc_front/src/modules/auth/domain/usecases/post_login.dart';
// import import 'package:memobelc_front/src/modules/auth/domain/usecases/post_register.dart';
// import import 'package:memobelc_front/src/modules/auth/external/datasources/http/login_datasource.dart';
// import import 'package:memobelc_front/src/modules/auth/external/datasources/http/register_datasource.dart';
// import import 'package:memobelc_front/src/modules/auth/infra/datasources/login_datasource.dart';
// import import 'package:memobelc_front/src/modules/auth/infra/datasources/register_datasource.dart';
// import import 'package:memobelc_front/src/modules/auth/infra/repositories/login_repositories.dart';
// import import 'package:memobelc_front/src/modules/auth/infra/repositories/resgister_repositories.dart';
import 'package:memobelc_front/src/modules/auth/presenter/pages/login_page.dart';
import 'package:memobelc_front/src/modules/auth/presenter/pages/forgot_password_page.dart';
import 'package:memobelc_front/src/modules/auth/presenter/pages/register_page.dart';
// import import 'package:memobelc_front/src/modules/auth/presenter/stores/auth_store.dart';
// import import 'package:memobelc_front/src/modules/dashboard/dashboard_module.dart';


class AuthModule extends Module {
  @override
  void binds(i) {
    i.add(http.Client.new);

    // i.add<IPostLoginDatasource>(LoginDatasource.new);
    // i.add<IPostRegisterDatasource>(RegisterDatasource.new);

    // i.add<ILoginRepository>(LoginRepository.new);
    // i.add<IRegisterRepository>(RegisterRepository.new);

    // i.add<IPostLogin>(PostLogin.new);
    // i.add<IPostRegister>(PostRegister.new);

    // i.addSingleton<AuthStore>(AuthStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const LoginPage());
    r.child('/register', child: (context) => const RegisterPage());
    r.child('/forgot-password', child: (context) => const ForgotPasswordPage());

    // r.module('/dashboard/', module: DashboardModule());
  }
}
