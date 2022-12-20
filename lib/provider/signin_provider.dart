import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class SignInProvider extends ChangeNotifier {
  String? _email;
  String? _password;

  String? get email => _email;

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  String? get password => _password;

  set password(String? value) {
    _password = value;
    notifyListeners();
  }

  void disposeData()
  {
    this.email = null;
    this.password = null;
  }

  Future<UserCredential?> signInUserWithEmail() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      return await auth
          .signInWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((userCredential) {
        if (!userCredential.user!.emailVerified) {
          userCredential.user!.sendEmailVerification();
        }
        return userCredential;
      });
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
