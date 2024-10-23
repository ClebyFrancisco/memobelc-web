import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/external/server_routes.dart';
import 'package:memobelc_front/src/modules/auth/infra/datasources/code_datasource.dart';

class CodeDatasource implements IPostCodeDatasource {
  final http.Client httpClient;

  CodeDatasource(this.httpClient);

  @override
  Future<Uint8List?> postCode(Uint8List userEncoded, String token) async {
    try {
      final response = await httpClient.post(
        Uri.parse(codeRoute),
        body: userEncoded,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-protobuf',
        },
      );
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw ExternalError('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw ExternalError('Error to connect with server, $e');
    }
  }
}
