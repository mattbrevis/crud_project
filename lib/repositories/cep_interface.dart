
import 'package:crud_project/model/address_model.dart';

abstract class ICepInterface {
  Future<AddressClientModel?> getAddress(String cep);
  
}