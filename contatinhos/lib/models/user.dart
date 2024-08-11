import 'dart:convert';

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));

String commentsToJson(Comments data) => json.encode(data.toJson());

class Comments {
    String nome;
    String email;
    String senha;

    Comments({
        required this.nome,
        required this.email,
        required this.senha,
    });

    factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        nome: json["nome"],
        email: json["email"],
        senha: json["senha"],
    );

    Map<String, dynamic> toJson() => {
        "nome": nome,
        "email": email,
        "senha": senha,
    };
}