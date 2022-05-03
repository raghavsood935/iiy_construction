class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? contactNumber;

  //contructor
  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    this.contactNumber,
  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      contactNumber: map['contactNumber'],
    );
  }

  //sending data from server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'contactNumber': contactNumber,
    };
  }
}
