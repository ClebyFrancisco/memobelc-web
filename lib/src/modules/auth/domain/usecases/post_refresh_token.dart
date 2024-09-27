import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/domain/repositories/refresh_token.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';

abstract class IPostRefreshToken {
  Future<(IError?, LoginResponse?)> call(String token);
}

class PostRefreshToken implements IPostRefreshToken {
  final IRefreshTokenRepository _loginRepository;

  PostRefreshToken(this._loginRepository);

  @override
  Future<(IError?, LoginResponse?)> call(data) async {
    return await _loginRepository.postRefreshToken(data);
  }
}
