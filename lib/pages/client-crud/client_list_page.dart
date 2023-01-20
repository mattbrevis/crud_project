import 'package:crud_project/db/virtual_db.dart';
import 'package:crud_project/repositories/client_repository.dart';
import 'package:flutter/material.dart';

import '../../model/client_model.dart';
import 'client_page.dart';

class ClientListPage extends StatefulWidget {
  const ClientListPage({super.key});

  @override
  State<ClientListPage> createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
  List<ClientModel> listClientModel = [];
  VirtualDB myDataBase = VirtualDB();
  bool isLoading = true;

  void addDataListClient() async {
     setState(() {
      isLoading = true;
    });
    listClientModel.clear();
    listClientModel = await ClientRepository(myDataBase).getAll();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {    
    addDataListClient();    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Client List')),
      body: isLoading ==false? Container(
        color: Colors.white,
        child: listClientModel.isNotEmpty? SingleChildScrollView(
            child: ListView.builder(

              shrinkWrap: true,
              itemCount: listClientModel.length,
              itemBuilder: ((context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  height: 100,
                  child: Card(
                      child: Center(child: Text(listClientModel[index].nameClient)),
                  ),
                );
              }))) : const Center(child: Text('No data'),),
      ) : const Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
          onPressed: (() async {
            await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ClientPage()));
            addDataListClient();
          }),
          child: const Icon(Icons.save_as_sharp)),
    );
  }
}
