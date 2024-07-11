import 'dart:convert';
Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));
String commentsToJson(Comments data) => json.encode(data.toJson());

class Comments {
    int postId;
    int id;
    String name;
    String email;
    String body;

    Comments({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    factory Comments.fromJson(Map<String, dynamic> json) => Comments(
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
