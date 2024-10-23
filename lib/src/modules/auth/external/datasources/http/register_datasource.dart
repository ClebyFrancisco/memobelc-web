import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/external/server_routes.dart';
import 'package:memobelc_front/src/modules/auth/infra/datasources/register_datasource.dart';




class RegisterDatasource implements IPostRegisterDatasource {
  final http.Client httpClient;

  RegisterDatasource(this.httpClient);

  @override
  Future<Uint8List?> postRegister(Uint8List userEncoded) async {
try {
      final response = await httpClient.post(
        Uri.parse(registerRoute),
        body: userEncoded,
      );
      if (response.statusCode == 201) {
        return response.bodyBytes;
      }
    } catch (e) {
      throw ExternalError('error to connect with server, $e');
    }
    return null;
  }
}

