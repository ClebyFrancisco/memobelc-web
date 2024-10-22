import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:memobelc_front/src/modules/auth/domain/repositories/login_repository.dart';
import 'package:memobelc_front/src/modules/auth/domain/repositories/refresh_token.dart';
import 'package:memobelc_front/src/modules/auth/domain/usecases/post_login.dart';
import 'package:memobelc_front/src/modules/auth/domain/usecases/post_refresh_token.dart';
import 'package:memobelc_front/src/modules/auth/external/datasources/http/auth_datasource.dart';
import 'package:memobelc_front/src/modules/auth/external/datasources/http/refresh_token_datasource.dart';
import 'package:memobelc_front/src/modules/auth/infra/datasources/login_datasource.dart';
import 'package:memobelc_front/src/modules/auth/infra/datasources/refresh_token_datasource.dart';
import 'package:memobelc_front/src/modules/auth/infra/repositories/login_repository.dart';
import 'package:memobelc_front/src/modules/auth/infra/repositories/refresh_token_repo.dart';
import 'package:memobelc_front/src/modules/auth/presenter/pages/login_page.dart';
import 'package:memobelc_front/src/modules/auth/presenter/pages/forgot_password_page.dart';
import 'package:memobelc_front/src/modules/auth/presenter/pages/register_page.dart';
import 'package:memobelc_front/src/modules/auth/presenter/pages/splash_page.dart';
import 'package:memobelc_front/src/modules/auth/presenter/pages/verify_code_page.dart';
import 'package:memobelc_front/src/modules/auth/presenter/stores/auth_store.dart';
import 'package:memobelc_front/src/modules/dashboard/dash_module.dart';


class AuthModule extends Module {
  @override
  void binds(i) {
    i.add(http.Client.new);

    i.add<IPostLoginDatasource>(LoginDatasource.new);
    i.add<IPostRefreshTokenDatasource>(RefreshTokenDatasource.new);
    // i.add<IPostRegisterDatasource>(RegisterDatasource.new);

    i.add<ILoginRepository>(LoginRepository.new);
    i.add<IRefreshTokenRepository>(RefreshTokenRepository.new);
    // i.add<IRegisterRepository>(RegisterRepository.new);

    i.add<IPostLogin>(PostLogin.new);
    i.add<IPostRefreshToken>(PostRefreshToken.new);
    // i.add<IPostRegister>(PostRegister.new);

    i.addSingleton<AuthStore>(AuthStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const SplashPage());
    r.child('/login', child: (context) => const LoginPage());
    r.child('/register', child: (context) => const RegisterPage());
    r.child('/code', child: (context) => const VerificationCodePage());
    r.child('/forgot-password', child: (context) => const ForgotPasswordPage());

    r.module('/dashboard/', module: DashboardModule());
  }
}
