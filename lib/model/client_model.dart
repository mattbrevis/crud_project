import 'dart:convert';
import 'package:crud_project/model/address_model.dart';

class ClientModel {
  ClientModel({
    required this.id,
    required this.nameClient,
    required this.cpfCnpjClient,
    required this.bornDate,
    required this.emailClient,    
    required this.phone,
    this.address
  });
  int id;
  String nameClient;
  String cpfCnpjClient;
  DateTime bornDate;
  String emailClient;
  String phone;
  AddressModel? address;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameClient': nameClient,
      'cpfCnpjClient': cpfCnpjClient,
      'bornDate': bornDate,
      'emailClient': emailClient,
      'addressClient': address,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] as int,
      nameClient: map['nameClient'] as String,
      cpfCnpjClient: map['cpfCnpjClient'] as String,
      bornDate: map['bornDate'],
      emailClient: map['emailClient'] as String,  
      phone: map['phone'] as String
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) => ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
