import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/domain/repositories/code_repository.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';

abstract class IPostCode {
  Future<(IError?, LoginResponse?)> call(CodeRequest data, String token);
}

class PostCode implements IPostCode {
  final ICodeRepository _loginRepository;

  PostCode(this._loginRepository);

  @override
  Future<(IError?, LoginResponse?)> call(data, token) async {
    return await _loginRepository.postCode(data, token);
  }
}
