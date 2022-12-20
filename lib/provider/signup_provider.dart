import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class SignUpProvider extends ChangeNotifier {
  String? _email;
  String? _password;
  String? _confirmPassword;

  String? get confirmPassword => _confirmPassword;

  set confirmPassword(String? value) {
    _confirmPassword = value;
    notifyListeners();
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get password => _password;

  set password(String? value) {
    _password = value;
  }

  void disposeData()
  {
    this.email = null;
    this.password = null;
    this.confirmPassword = null;
  }

  Future<UserCredential?> registerNewUserWithEmail() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      if (email!.isNotEmpty && password!.isNotEmpty) {
        return await auth.createUserWithEmailAndPassword(
          email: email!,
          password: password!,
        );
      }
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
    return null;
  }
}
