import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/domain/repositories/register_repository.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';

abstract class IPostRegister {
  Future<(IError?, RegisterResponse?)> call(RegisterRequest data);
}

class PostRegister implements IPostRegister {
  final IRegisterRepository _registerRepository;

  PostRegister(this._registerRepository);

  @override
  Future<(IError?, RegisterResponse?)> call(data) async {
    return await _registerRepository.postRegister(data);
  }
}
