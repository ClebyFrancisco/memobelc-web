import 'dart:typed_data';
abstract class IPostRegisterDatasource{
  Future<Uint8List?> postRegister(Uint8List userEncoded);
}
