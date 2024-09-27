import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/external/server_routes.dart';
import 'package:memobelc_front/src/modules/auth/infra/datasources/refresh_token_datasource.dart';


class RefreshTokenDatasource implements IPostRefreshTokenDatasource {
  final http.Client httpClient;

  RefreshTokenDatasource(this.httpClient);

  @override
  Future<Uint8List?> postRefreshToken(Uint8List tokenEncoded) async {
try {
      final response = await httpClient.post(
        Uri.parse(refreshToken),
        body: tokenEncoded,
      );
      if (response.statusCode == 200) {
        return response.bodyBytes;
      }
    } catch (e) {
      throw ExternalError('error to connect with server, $e');
    }
    return null;
  }
}

