import 'dart:convert';

class AddressEntity {
  int id;
  String cep;
  String cidade;
  String uf;
  String logradouro;
  int numero;
  String bairro;
  String? complemento;
  
  factory AddressEntity.empty() {
    return AddressEntity(
      id: -1,
      cep: '',
      cidade: '',
      uf: '',
      logradouro: '',
      numero: -1,
      bairro: '',
      complemento: '',
    );
  }

  AddressEntity({
    required this.id,
    required this.cep,
    required this.cidade,
    required this.uf,
    required this.logradouro,
    required this.numero,
    required this.bairro,
    required this.complemento,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cep': cep,
      'cidade': cidade,
      'uf': uf,
      'logradouro': logradouro,
      'numero': numero,
      'bairro': bairro,
      'complemento': complemento,
    };
  }

  factory AddressEntity.fromMap(Map<String, dynamic> map) {
    return AddressEntity(
      id: map['id']?.toInt() ?? 0,
      cep: map['cep'] ?? '',
      cidade: map['cidade'] ?? '',
      uf: map['uf'] ?? '',
      logradouro: map['logradouro'] ?? '',
      numero: map['numero']?.toInt() ?? 0,
      bairro: map['bairro'] ?? '',
      complemento: map['complemento'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressEntity.fromJson(String source) => AddressEntity.fromMap(json.decode(source));
}
