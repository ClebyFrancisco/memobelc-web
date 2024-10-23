import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/external/server_routes.dart';
import 'package:memobelc_front/src/modules/auth/infra/datasources/login_datasource.dart';



class LoginDatasource implements IPostLoginDatasource {
  final http.Client httpClient;

  LoginDatasource(this.httpClient);

  @override
  Future<Uint8List?> postLogin(Uint8List userEncoded) async {
try {
      final response = await httpClient.post(
        Uri.parse(loginRoute),
        body: userEncoded,
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

