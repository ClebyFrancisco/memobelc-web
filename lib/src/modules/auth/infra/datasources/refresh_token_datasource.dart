import 'dart:typed_data';

abstract class IPostRefreshTokenDatasource {
  Future<Uint8List?> postRefreshToken(Uint8List userEncoded);
}
