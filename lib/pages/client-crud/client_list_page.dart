import 'package:flutter/material.dart';

import 'client_page.dart';

class ClientListPage extends StatefulWidget {
  const ClientListPage({super.key});

  @override
  State<ClientListPage> createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Client List')),
      body: Container(
        color: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (() {

            Navigator.push(context, MaterialPageRoute(builder: (context) => const ClientPage()));
          }),
          child: const Icon(Icons.save_as_sharp)
          ),
    );
  }
}
