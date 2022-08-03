// class UserModel {
//   String? uid;
//   String? email;
//   String? fullName;
//   String? nickName;
//   String? phone;
//   String? date;
//
//   UserModel(this.uid, this.email, this.fullName, this.nickName, this.phone,
//       this.date);
//
//   factory UserModel.fromMap(map) {
//     return UserModel(
//       map['uid'],
//       map['email'],
//       map['fullName'],
//       map['nickName'],
//       map['phone'],
//       map['date'],
//     );
//   }
//
//   // sending data to our server
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'email': email,
//       'fullName': fullName,
//       'nickName': nickName,
//       'phone': phone,
//       'date': date,
//     };
//   }
// }

class UserModel {
  String? uid;
  String? email;
  String? fullName;
  String? nickName;
  String? phone;
  String? month;
  String? day;
  String? year;
  String? password;
  String? gen;

  UserModel({this.uid, this.email, this.fullName, this.nickName,this.phone, this.month,this.day,this.year,this.gen,this.password});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
      nickName: map['nickName'],
      phone: map['phone'],
      month: map['month'],
      year: map['year'],
      day: map['day'],
      password: map['password'],
      gen: map['gen'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'nickName': nickName,
      'phone': phone,
      'month': month,
      'year': year,
      'day': day,
      'password': password,
      'gen': gen,
    };
  }
}
