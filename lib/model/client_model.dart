import 'dart:convert';

class ClientModel {
  ClientModel({
    required this.nameClient,
    required this.cpfCnpjClient,
    required this.bornDate,
    required this.emailClient,
    required this.addressClient,
  });
  
  String nameClient;
  String cpfCnpjClient;
  DateTime bornDate;
  String emailClient;
  String addressClient;

  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameClient': nameClient,
      'cpfCnpjClient': cpfCnpjClient,
      'bornDate': bornDate,
      'emailClient': emailClient,
      'addressClient': addressClient,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      nameClient: map['nameClient'] as String,
      cpfCnpjClient: map['cpfCnpjClient'] as String,
      bornDate: map['bornDate'],
      emailClient: map['emailClient'] as String,
      addressClient: map['addressClient'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) => ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
