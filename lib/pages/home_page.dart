import 'package:crud_project/pages/client/client_list_page.dart';
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
      body: Container(
        color: Colors.indigo,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [            
            const Text('Welcome to my CRUD Project :)',textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white, )),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 350,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClientListPage()));
                },
                child: const Text(
                  'CRUD - Client',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
