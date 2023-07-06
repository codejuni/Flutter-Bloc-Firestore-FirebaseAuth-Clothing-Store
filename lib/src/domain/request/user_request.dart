// Model class representing a user request
class UserRequest {
  final String name;
  final String surname;
  final String email;
  final String password;

  // Constructor for creating a UserRequest instance
  UserRequest({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
  });

  // Convert UserRequest instance to a map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'email': email,
      'image':
          'https://th.bing.com/th/id/R.a35180be02e3aaa46a27fcd077bac4ee?rik=EaHb8aa1ARGBaA&pid=ImgRaw&r=0',
      'bag': [],
    };
  }
}
