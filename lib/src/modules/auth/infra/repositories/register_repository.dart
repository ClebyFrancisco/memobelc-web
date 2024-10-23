import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/domain/repositories/register_repository.dart';
import 'package:memobelc_front/src/modules/auth/infra/adapters/register_adapter.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';
import 'package:memobelc_front/src/modules/auth/infra/datasources/register_datasource.dart';

class RegisterRepository implements IRegisterRepository {
  final IPostRegisterDatasource postRegisterDatasource;

  RegisterRepository(this.postRegisterDatasource);

  @override
  Future<(IError?, RegisterResponse?)> postRegister(
      RegisterRequest data) async {
    try {
      final userEncoded = RegisterAdapter.dataToProto(data);
      final response = await postRegisterDatasource.postRegister(userEncoded);
      final user = RegisterAdapter.protoToData(response);
      
      if (user != null) {
        return (null, user);
      } else {
        return (const InfraError('user not found'), null);
      }
    } on IError catch (e) {
      return (e, null);
    }
  }
}
