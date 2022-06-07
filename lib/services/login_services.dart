import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:video_call/constant.dart';

class LoginServices {
  final auth = FirebaseAuth.instance;

  login(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      print(auth.currentUser);
      await sendData(email, password, auth.currentUser!.uid);
    } catch (e) {
      print(e.toString());
    }
  }

  sendData(String name, String password, String uid) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");

    await ref.set({
      "email": name,
      "password": password,
      "uid": uid,
      "channel": K.channel,
      "appId": K.appId,
      "appToken": K.appToken
    });
    print(ref.key);
  }

  get() async {
    final ref = FirebaseDatabase.instance.ref();
    final result =
        await FirebaseDatabase.instance.ref().child("users/123").once();
  }

  Future delete(String uid) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$uid");
    await ref.remove();
    print(ref.key);
  }
}
