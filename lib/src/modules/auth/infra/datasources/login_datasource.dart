import 'dart:typed_data';
abstract class IPostLoginDatasource{
  Future<Uint8List?> postLogin(Uint8List userEncoded);
}
