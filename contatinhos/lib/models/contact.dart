import 'dart:convert';

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));

String commentsToJson(Comments data) => json.encode(data.toJson());

class Comments {
    String nome;
    String descricao;
    String telefone;

    Comments({
        required this.nome,
        required this.descricao,
        required this.telefone,
    });

    factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        nome: json["nome"],
        descricao: json["descricao"],
        telefone: json["telefone"],
    );

    Map<String, dynamic> toJson() => {
        "nome": nome,
        "descricao": descricao,
        "telefone": telefone,
    };
}