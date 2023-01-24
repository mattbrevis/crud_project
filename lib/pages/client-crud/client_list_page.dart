import 'package:flutter/material.dart';
import 'package:crud_project/db/virtual_db.dart';
import 'package:crud_project/repositories/client_repository.dart';
import 'package:intl/intl.dart';
import '../../model/client_model.dart';
import 'client_page.dart';

class ClientListPage extends StatefulWidget {
  const ClientListPage({super.key});
  @override
  State<ClientListPage> createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
  List<ClientModel> listClientModel = [];
  bool isLoading = true;

  void addDataListClient() async {
    setState(() {
      isLoading = true;
    });
    listClientModel.clear();
    listClientModel = await ClientRepository(VirtualDB()).getAll();
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
    final formatter = DateFormat('dd-MM-yyyy');

    return Scaffold(
      appBar: AppBar(title: const Text('Client List')),
      body: isLoading == false
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: listClientModel.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: listClientModel.length,
                              itemBuilder: ((context, index) {
                                String bornDateMask = formatter
                                    .format(listClientModel[index].bornDate)
                                    .toString();

                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  width: MediaQuery.of(context).size.width * .8,
                                  height: 160,
                                  child: Card(
                                    elevation: 2,
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      alignment: Alignment.center,
                                      child: ListTile(
                                        title: Text(
                                          'NAME/COMPANY: ${listClientModel[index].nameClient.toUpperCase()}',
                                          textAlign: TextAlign.center,
                                        ),
                                        subtitle: Text(
                                            'CPF/CNPJ: ${listClientModel[index].cpfCnpjClient.toString()} \nBorn Date: $bornDateMask \nE-mail: ${listClientModel[index].emailClient.toString()} \nAddress:  ${listClientModel[index].addressClient.toString()} ',
                                            textAlign: TextAlign.center),
                                        trailing: Container(
                                          width: 100,
                                          height: 120,
                                          alignment: Alignment.center,
                                          child: Row(children: [
                                            IconButton(
                                                onPressed: ()  async{
                                                  await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ClientPage(clientModel: listClientModel[index],)));
                                                              addDataListClient();
                                                },
                                                icon: const Icon(Icons.edit)),
                                            IconButton(
                                                onPressed: ()  {
                                                   ClientRepository(
                                                          VirtualDB())
                                                      .delete(
                                                          listClientModel[index]
                                                              .id);
                                                  addDataListClient();
                                                },
                                                icon: const Icon(Icons.delete,
                                                    color: Colors.red))
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }))),
                    )
                  : const Center(
                      child: Text('No data'),
                    ),
            )
          : const Center(child: CircularProgressIndicator()),
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
