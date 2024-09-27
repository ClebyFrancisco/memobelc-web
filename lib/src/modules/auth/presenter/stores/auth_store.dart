import 'package:memobelc_front/src/modules/auth/domain/usecases/post_login.dart';
import 'package:memobelc_front/src/modules/auth/domain/usecases/post_refresh_token.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';
import 'package:memobelc_front/src/provider/shared_preferences.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final IPostLogin _loginUseCase;
  final IPostRefreshToken _refreshToken;

  _AuthStore(this._loginUseCase, this._refreshToken);

  final currentUser = LoginResponse();
  bool rememberMe = true;

  Future<bool> login(String email, String password) async {
    final response = await _loginUseCase
        .call(LoginRequest(email: email, password: password));
    if (response.$2 != null) {
      currentUser.email = response.$2!.email;
      currentUser.name = response.$2!.name;
      currentUser.token = response.$2!.token;

      saveUserToken(response.$2!.token);
      return true;
    }
    return false;
  }

  Future<bool> refreshToken(String token) async {
    final response = await _refreshToken.call(token);
    if (response.$2 != null) {
      currentUser.email = response.$2!.email;
      currentUser.name = response.$2!.name;
      currentUser.token = response.$2!.token;

      if (rememberMe) {
        saveUserToken(response.$2!.token);
      }

      return true;
    }
    return false;
  }
}
