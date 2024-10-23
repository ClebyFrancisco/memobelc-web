import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/domain/repositories/code_repository.dart';
import 'package:memobelc_front/src/modules/auth/infra/adapters/code_adapter.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';
import 'package:memobelc_front/src/modules/auth/infra/datasources/code_datasource.dart';


class CodeRepository implements ICodeRepository {
  final IPostCodeDatasource postCodeDatasource;

  CodeRepository(this.postCodeDatasource);

  @override
  Future<(IError?, LoginResponse?)> postCode(CodeRequest data, String token) async {
    try {
      final userEncoded = CodeAdapter.dataToProto(data);
      final response = await postCodeDatasource.postCode(userEncoded, token);
      final user = CodeAdapter.protoToData(response);
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
