import 'dart:convert';
Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));
String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
    int postId;
    int id;
    String name;
    String email;
    String body;

    Posts({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
