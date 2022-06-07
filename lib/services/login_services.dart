import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginServices {
  final auth = FirebaseAuth.instance;

  login(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(auth.currentUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future delete() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/stats");
    await ref.remove();
    print(ref.key);
  }
}
