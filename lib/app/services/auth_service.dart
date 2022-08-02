import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print("Login Success");
    return true;
  } catch (e) {
    print(e);
    print("Sorry, Login Error");
    return false;
  }
}

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    print("Register success at $email");
    return false;
  } catch (e) {
    print("Register failed");
    print(e.toString());
    return false;
  }
}


// Future<bool> addCoin(String id, String amount) async {
//   try {
//     String uid = FirebaseAuth.instance.currentUser!.uid;
//     var value = double.parse(amount);
//     DocumentReference documentReference = FirebaseFirestore.instance
//         .collection('Users')
//         .doc(uid)
//         .collection('Coins')
//         .doc(id);
//     FirebaseFirestore.instance.runTransaction((transaction) async {
//       DocumentSnapshot snapshot = await transaction.get(documentReference);
//       if (!snapshot.exists) {
//         documentReference.set({'Amount': value});
//         return true;
//       }
//       double newAmount = snapshot.data()['Amount'] + value;
//       transaction.update(documentReference, {'Amount': newAmount});
//       return true;
//     });
//     return true;
//   } catch (e) {
//     return false;
//   }
// }
