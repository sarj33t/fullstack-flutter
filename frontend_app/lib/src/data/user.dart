/// [User]
class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? avatar;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.avatar
  });

  // Factory constructor to map Firestore JSON response to User object
  factory User.fromJson(Map<String, dynamic> json) {
    // Mapping Firestore fields
    return User(
      id: json['id']?['integerValue'],
      firstName: json['first_name']?['stringValue'],
      lastName: json['last_name']?['stringValue'],
      email: json['email']?['stringValue'],
      avatar: json['avatar']?['stringValue'],
    );
  }
}