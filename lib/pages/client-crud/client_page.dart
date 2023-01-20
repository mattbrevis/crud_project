import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  TextEditingController nameController = TextEditingController();
  Widget getInputLabel(textLabel) {
    return SizedBox(
        width: 100,
        height: 100,
        child: Text(textLabel,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            )));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: width * 0.9,
                      child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            label: Text('Name'),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                          ))),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: width * 0.9,
                      child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            label: Text('CPF'),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                          ))),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: width * 0.9,
                      child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            label: Text('Born Date'),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                          ))),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: width * 0.9,
                      child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            label: Text('E-mail'),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                          ))),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: width * 0.9,
                      child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            label: Text('Address'),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                          ))),
                ],
              ),
            ),
          )),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        color: Colors.white,
        height: 70,
        width: width * 0.85,
        child: ElevatedButton(child: const Text('Save'),onPressed: (){}),
    ));
  }
}
