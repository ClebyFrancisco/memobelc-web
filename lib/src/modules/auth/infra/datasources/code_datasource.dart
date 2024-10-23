import 'dart:typed_data';
abstract class IPostCodeDatasource{
  Future<Uint8List?> postCode(Uint8List userEncoded, String token);
}
