import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  int id;
  String nome;
  String descricao;
  String telefone;

  Contact({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.telefone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"], 
        nome: json["nome"],
        descricao: json["descricao"],
        telefone: json["telefone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descricao": descricao,
        "telefone": telefone,
      };
}
