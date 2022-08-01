// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';
// import 'package:jwt_decode/jwt_decode.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// class UserService{
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseFirestore _firestore= FirebaseFirestore.instance;
//  FlutterSecureStorage _storage = new FlutterSecureStorage();
//
//   UserService(){
//     initializeFirebaseApp();
//   }
//
//   void initializeFirebaseApp() async{
//     bool internetConnection = await checkInternetConnectivity();
//     if(internetConnection){
//       await Firebase.initializeApp();
//       _auth = FirebaseAuth.instance;
//       _firestore = FirebaseFirestore.instance;
//      _storage = new FlutterSecureStorage();
//     }
//   }
//
//   int statusCode;
//   String msg;
//
//   void storeJWTToken(String idToken, refreshToken) async{
//     await _storage.write(key: 'idToken', value: idToken);
//     await _storage.write(key: 'refreshToken', value: refreshToken);
//   }
//
//   String validateToken(String token){
//     bool isExpired = Jwt.isExpired(token);
//
//     if(isExpired){
//       return '';
//     }
//     else{
//       Map<String, dynamic> payload = Jwt.parseJwt(token);
//       return payload['user_id'];
//     }
//   }
//
//   Future<void> login(userValues) async{
//     String email = userValues['email'];
//     String password = userValues['password'];
//
//     await _auth.signInWithEmailAndPassword(email: email, password: password).then((dynamic user) async{
//       final User currentUser = _auth.currentUser!;
//
//       String idToken = await currentUser.getIdToken();
//       String refreshToken = currentUser.refreshToken!;
//
//       storeJWTToken(idToken, refreshToken);
//
//       statusCode = 200;
//
//     }).catchError((error){
//       handleAuthErrors(error);
//     });
//   }
//   void handleAuthErrors(error){
//     String errorCode = error.code;
//     switch(errorCode){
//       case "ERROR_EMAIL_ALREADY_IN_USE":
//         {
//           statusCode = 400;
//           msg = "Email ID already existed";
//         }
//         break;
//       case "ERROR_WRONG_PASSWORD":
//         {
//           statusCode = 400;
//           msg = "Password is wrong";
//         }
//     }
//   }
//
//
//   String getConnectionValue(var connectivityResult) {
//     String status = '';
//     switch (connectivityResult) {
//       case ConnectivityResult.mobile:
//         status = 'Mobile';
//         break;
//       case ConnectivityResult.wifi:
//         status = 'Wi-Fi';
//         break;
//       case ConnectivityResult.none:
//         status = 'None';
//         break;
//       default:
//         status = 'None';
//         break;
//     }
//     return status;
//   }
//
//   Future<bool> checkInternetConnectivity() async{
//     final Connectivity _connectivity = Connectivity();
//     ConnectivityResult result = await _connectivity.checkConnectivity();
//     String connection = getConnectionValue(result);
//     if(connection == 'None') {
//       return false;
//     }
//     else{
//       return true;
//     }
//   }
// }
//
