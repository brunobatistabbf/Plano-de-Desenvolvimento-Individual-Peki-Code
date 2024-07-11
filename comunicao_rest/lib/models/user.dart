import 'dart:convert';
User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
    int id;
    String name;
    String username;
    String email;
    String phone;
    String website;
    String company;

    User({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.phone,
        required this.website,
        required this.company,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        website: json["website"],
        company: json["company"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "phone": phone,
        "website": website,
        "company": company,
    };
}
