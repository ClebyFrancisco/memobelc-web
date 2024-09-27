import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/domain/repositories/refresh_token.dart';
import 'package:memobelc_front/src/modules/auth/infra/adapters/refresh_token.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';
import 'package:memobelc_front/src/modules/auth/infra/datasources/refresh_token_datasource.dart';

class RefreshTokenRepository implements IRefreshTokenRepository {
  final IPostRefreshTokenDatasource postRefreshTokenDatasource;

  RefreshTokenRepository(this.postRefreshTokenDatasource);

  @override
  Future<(IError?, LoginResponse?)> postRefreshToken(String token) async {
    try {
      final tokenEncoded = RefreshTokenAdapter.dataToProto(RefreshToken(token: token));
      final response =
          await postRefreshTokenDatasource.postRefreshToken(tokenEncoded);
      final user = RefreshTokenAdapter.protoToData(response);
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
