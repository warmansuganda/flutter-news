class Author {
  final String firstName;
  final String lastName;

  Author({required this.firstName, required this.lastName});

  getName() {
    List<String> fullname = [firstName];
    if (lastName.isNotEmpty) fullname.add(lastName);
    return fullname.join(' ');
  }

  factory Author.fromApi(Map<String, dynamic> json) {
    return Author(firstName: json['firstname'], lastName: 'lastname');
  }

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(firstName: json['firstName'], lastName: 'lastName');
  }

  Author copyWith({
    String? firstName,
    String? lastName,
  }) {
    return Author(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName);
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
