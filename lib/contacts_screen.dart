import 'package:assignment3_fluttera/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'contact_widget.dart';

class ContactsScreen extends StatefulWidget {
  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  int counter = 0;

  List<ContactModel> contacts = [
    ContactModel(name: '', phone: '', index: 0),
    ContactModel(name: '', phone: '', index: 1),
    ContactModel(name: '', phone: '', index: 2),
  ];

  TextEditingController nameText = TextEditingController();

  TextEditingController phoneText = TextEditingController();

  late TextEditingController textEditingController;

  late Function onClick;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(child: Text('Contacts Screen')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Please Enter Your Name Here';
                  }
                },
                controller: nameText,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: ' Enter Your Name Here',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    suffixIcon: Icon(Icons.edit, color: Colors.blue)),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Please Enter your Number Here';
                  }
                },
                controller: phoneText,
                keyboardType: TextInputType.phone,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Your Number Here',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  suffixIcon: Icon(Icons.call, color: Colors.blue),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                      child: FilledButton(
                          onPressed: () {
                            clickOnAddButton();
                          },
                          child: Text('add'))),
                  SizedBox(
                    width: 5.0,
                  ),
                ],
              ),
              ContactWidget(
                contactModel: contacts[0],
                clickOnDeleteIcon: clickOnDeleteIcon,
              ),
              ContactWidget(
                contactModel: contacts[1],
                clickOnDeleteIcon: clickOnDeleteIcon,
              ),
              ContactWidget(
                contactModel: contacts[2],
                clickOnDeleteIcon: clickOnDeleteIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clickOnAddButton() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    contacts[counter].name = nameText.text;
    contacts[counter].phone = phoneText.text;
    if (counter < 2) {
      counter++;
    }

    setState(() {});
    for (ContactModel model in contacts) {
      print(model.name);
      print(model.phone);
    }
  }

// void clickOnDeleteButton(){
//
//   contacts[counter].name='';
//   contacts[counter].phone='';
//   if(counter>=0){
//     counter--;
//   }
//   setState(() {
//
//   });
// }
  void clickOnDeleteIcon(int index) {
    contacts[counter].name = '';
    contacts[counter].phone = '';
    counter--;
    setState(() {});
  }
}
