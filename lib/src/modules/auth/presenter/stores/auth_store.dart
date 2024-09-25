import 'package:memobelc_front/src/modules/auth/domain/usecases/post_login.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final IPostLogin _loginUseCase;

  _AuthStore(this._loginUseCase);

  // late final currentUser;

  Future<bool> login(String userName, String password) async {
    print('username: ' + userName + ' password: ' + password);
    final response = await _loginUseCase.call(userName, password);
    print(response);
    // if (response.$2 != null) {
    //   currentUser.id = response.$2!.id;
    //   currentUser.name = response.$2!.name;
    //   return true;
    // }
    return false;
  }
}
