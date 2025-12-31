import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> isAvailable() async {
    return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'تحقق من هويتك',
        biometricOnly: false, 
      );
    } catch (e) {
      print('Authentication failed: $e');
      return false;
    }
  }

  Future<bool> authenticateBiometricOnly() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'تحقق من هويتك باستخدام البصمة',
        biometricOnly: true,
      );
    } catch (e) {
      print('Biometric authentication failed: $e');
      return false;
    }
  }
}
