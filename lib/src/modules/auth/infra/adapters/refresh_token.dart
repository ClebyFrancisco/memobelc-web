import 'dart:typed_data';
import 'package:memobelc_front/src/modules/auth/domain/errors/error.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart'
    as proto;

class RefreshTokenAdapter {
  static proto.LoginResponse? protoToData(Uint8List? data) {
    try {
      if (data != null) {
        return proto.LoginResponse.fromBuffer(data);
      }
      return null;
    } catch (e) {
      throw InfraError('Error: $e');
    }
  }

  static Uint8List dataToProto(proto.RefreshToken data) {
    try {
      return data.writeToBuffer();
    } catch (e) {
      throw InfraError('Error: $e');
    }
  }
}
