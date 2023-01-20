
import 'package:crud_project/model/client_model.dart';
import 'package:crud_project/repositories/client_interface.dart';

import '../db/virtual_db.dart';

class ClientRepository implements IClientRepository{

  final VirtualDB _db;

  ClientRepository(this._db);

  @override
  Future<void> delete(int id) async {
    await _db.remove(id);
  }

  @override
  Future<List<ClientModel>> getAll() async {    
    var items = await _db.list();
    return items.map((item) => ClientModel.fromMap(item)).toList();    
  }

  @override
  Future<ClientModel?> getOne(int id) async{
    var item = await _db.findOne(id);
    return item != null ? ClientModel.fromMap(item) : null;
  }

  @override
  Future<void> insert(ClientModel client) async {
    await _db.insert(client.toMap());
  }

  @override
  Future<void> update(ClientModel client)async {
    await _db.update(client.toMap());
  }
  
}