class User {
  User(
      {required this.name,
      required this.email,
      required this.uid,
      required this.online});

  bool online;
  String email;
  String name;
  String uid;
}
