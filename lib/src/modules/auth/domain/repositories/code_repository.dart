import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';

abstract class ICodeRepository {
  Future<(IError?, LoginResponse?)> postCode(CodeRequest data, String token);
}
