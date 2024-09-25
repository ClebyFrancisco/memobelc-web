

import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/domain/repositories/login_repository.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';

abstract class IPostLogin {
  Future<(IError?, LoginResponse?)> call(String username, String password);
}

class PostLogin implements IPostLogin {
  final ILoginRepository _loginRepository;

  PostLogin(this._loginRepository);

  @override
  Future<(IError?, LoginResponse?)> call(String username, String password) async {
    return await _loginRepository.postLogin(username, password);
  }
}