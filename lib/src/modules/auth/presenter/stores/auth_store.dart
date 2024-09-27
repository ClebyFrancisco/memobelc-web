import 'package:memobelc_front/src/modules/auth/domain/usecases/post_login.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final IPostLogin _loginUseCase;

  _AuthStore(this._loginUseCase);

  // late final currentUser;

  Future<bool> login(String email, String password) async {
    final response = await _loginUseCase
        .call(LoginRequest(email: email, password: password));
    if (response.$2 != null) {
      print('token' + response.$2!.token);
      // currentUser.id = response.$2!.id;
      // currentUser.name = response.$2!.name;
      return true;
    }
    return false;
  }
}
