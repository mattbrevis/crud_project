import 'package:bottom_picker/bottom_picker.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:crud_project/db/virtual_db.dart';
import 'package:crud_project/model/client_model.dart';
import 'package:crud_project/repositories/client_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  VirtualDB virtualDB = VirtualDB();
  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();
  TextEditingController bornDateController =
      TextEditingController(text: '01/01/1999');
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int i = 0;
  bool isLoading = false;
  bool isEmailValid(String mail){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(mail);
  }
  
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


  Widget radioClient() {
    return Row(
      children: [
        Flexible(
          child: RadioListTile(
            title: const Text('P. Física'),
            value: 0,
            groupValue: i,
            onChanged: (value) {
              setState(() {
                i = value!;
              });
            },
          ),
        ),
        Flexible(
          child: RadioListTile(
            title: const Text('P. Jurídica'),
            value: 1,
            groupValue: i,
            onChanged: (value) {
              setState(() {
                i = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Future<void> addClient() async {
    setState(() {
      isLoading = true;
    });
    ClientModel clientModel = ClientModel(
        nameClient: nameController.text,
        cpfCnpjClient: i == 0 ? cpfController.text : cnpjController.text,
        bornDate: DateTime.parse('1969-07-20 20:18:04Z'),
        emailClient: emailController.text,
        addressClient: addressController.text);
    ClientRepository(virtualDB).insert(clientModel);
  }

  void showCalendar() {
    BottomPicker.date(
      title: 'Select your born date',
      dateOrder: DatePickerDateOrder.dmy,
      dismissable: true,
      pickerTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      ),
      titleStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 20,
        color: Colors.black,
      ),
      onSubmit: (value) {
        DateTime dt = value;
        String val = UtilData.obterDataDDMMAAAA(dt);
        setState(() {
          bornDateController.text = val;
        });
      },
      minDateTime: DateTime(1950, 1, 1),
      maxDateTime: DateTime(2000, 1, 1),
      initialDateTime: DateTime(1999, 1, 1),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Client-form'),
        ),
        body: Container(
            color: Colors.white,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 0.0, left: 20.0, right: 20.0, bottom: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      radioClient(),
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
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.grey)),
                            ),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required';
                              }
                              return null;
                            }),
                          )),
                      Visibility(
                        visible: i == 0,
                        child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: width * 0.9,
                            child: TextFormField(
                                controller: cpfController,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  CpfInputFormatter()
                                ],
                                decoration: const InputDecoration(
                                  label: Text('CPF'),
                                  hintText: '999.999.999-99',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
                                ),
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return 'CPF is required';
                                  } else if (CPFValidator.isValid(value) ==
                                      false) {
                                    return 'CPF invalid';
                                  }
                                  return null;
                                }))),
                      ),
                      Visibility(
                        visible: i == 1,
                        child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: width * 0.9,
                            child: TextFormField(
                                controller: cnpjController,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  CnpjInputFormatter()
                                ],
                                decoration: const InputDecoration(
                                  label: Text('CNPJ'),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
                                ),
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return 'CNPJ is required';
                                  } else if (CNPJValidator.isValid(value) ==
                                      false) {
                                    return 'CNPJ invalid';
                                  }
                                  return null;
                                }))),
                      ),
                      SizedBox(
                          width: width * 0.3,
                          child: GestureDetector(
                            child: TextFormField(
                                enabled: false,
                                controller: bornDateController,
                                keyboardType: TextInputType.datetime,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  DataInputFormatter()
                                ],
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                  label: Text('Born Date'),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.grey)),
                                ),
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Born Date is required';
                                  }
                                  return null;
                                })),
                            onTap: () {
                              showCalendar();
                            },
                          )),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: width * 0.9,
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              label: Text('E-mail'),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.grey)),
                            ),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'E-mail is required';
                              }else if(isEmailValid(value)==false){
                                return 'E-mail is not valid';
                              }
                              return null;
                            }),
                          )),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: width * 0.9,
                          child: TextFormField(
                              controller: addressController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.black,
                              decoration: const InputDecoration(
                                label: Text('Address'),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5, color: Colors.grey)),
                              ),
                              validator: ((value) {
                                if (value == null || value.isEmpty) {
                                  return 'Address required';
                                }
                                return null;
                              }))),
                    ],
                  ),
                ),
              ),
            )),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          color: Colors.white,
          height: 70,
          width: width * 0.85,
          child: ElevatedButton(
              child: isLoading == false
                  ? const Text('Save')
                  : const CircularProgressIndicator(color: Colors.white),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await addClient().then((value) {
                    Navigator.pop(context);
                  });
                }
              }),
        ));
  }
}
