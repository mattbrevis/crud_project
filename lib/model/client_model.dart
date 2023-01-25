import 'dart:convert';
import 'package:crud_project/model/address_model.dart';

class ClientModel {
  ClientModel({
    required this.id,
    required this.nameClient,
    required this.cpfCnpjClient,
    required this.bornDate,
    required this.emailClient,    
    required this.phoneClient,
    this.address
  });
  int id;
  String nameClient;
  String cpfCnpjClient;
  DateTime bornDate;
  String emailClient;
  String phoneClient;
  AddressClientModel? address;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameClient': nameClient,
      'cpfCnpjClient': cpfCnpjClient,
      'bornDate': bornDate,
      'emailClient': emailClient,
      'phoneClient':phoneClient,
      'address' : address

    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] as int,
      nameClient: map['nameClient'] as String,
      cpfCnpjClient: map['cpfCnpjClient'] as String,
      bornDate: map['bornDate'],
      emailClient: map['emailClient'] as String,  
      phoneClient: map['phoneClient'] as String,      
      address: map['address'] as AddressClientModel
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) => ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
