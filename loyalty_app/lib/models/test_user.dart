class TestUser {
  final int id;
  final String name;
  final String email;

  TestUser({this.id, this.name, this.email});

  factory TestUser.fromJson(Map<String, dynamic> parsedJson) {
    return TestUser(
      id: parsedJson['id'],
      name: parsedJson['name'] as String,
      email: parsedJson['email'] as String,
    );
  }
}
