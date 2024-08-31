import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String nome;
  String email;
  String senha;

  User({
    required this.nome,
    required this.email,
    required this.senha,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
