   import 'dart:convert';

import 'package:crud_project/model/address_model.dart';
import 'package:crud_project/repositories/cep_interface.dart';
import 'package:http/http.dart' as http;

class ICepRepository extends ICepInterface {
  static ICepRepository? _instance;
  ICepRepository._();
  static ICepRepository get instance{
    _instance??=  ICepRepository._();
    return _instance!;
   }

  @override
  Future<AddressClientModel> getAddress(String cep) async {
    var response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));        
    return AddressClientModel.fromJson(json.decode(response.body));
  }


}