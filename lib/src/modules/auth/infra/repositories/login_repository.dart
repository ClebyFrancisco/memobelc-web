
import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/domain/repositories/login_repository.dart';
import 'package:memobelc_front/src/modules/auth/infra/adapters/login_adapter.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';
import 'package:memobelc_front/src/modules/auth/infra/datasources/login_datasource.dart';



class LoginRepository implements ILoginRepository {
  final IPostLoginDatasource postLoginDatasource;

  LoginRepository(this.postLoginDatasource);

  @override
  Future<(IError?, LoginResponse?)> postLogin(String username, String password) async {
    try {
      final userEncoded = LoginAdapter.dataToProto(LoginRequest(email: username, password: password));
      print('userEncoded: t');
      final response = await postLoginDatasource.postLogin(userEncoded);
      final user = LoginAdapter.protoToData(response);
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
