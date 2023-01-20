import 'package:crud_project/model/client_model.dart';

abstract class IClientRepository {
  Future<List<ClientModel>> getAll();
  Future<ClientModel?> getOne(int id);
  Future<void> insert(ClientModel client);
  Future<void> update(ClientModel client);
  Future<void> delete(int id);
}