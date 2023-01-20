import 'package:crud_project/pages/client-crud/client_list_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(        
        height:  MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,       
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        SizedBox(
            width: 200,
            height: 45,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ClientListPage()));
                },
                child: const Text('CRUD - Client',
                    style: TextStyle(color: Colors.white, fontSize: 22)))),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: const Center(
          child: Text(
            'Welcome :)',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
