import 'package:assignment3_fluttera/model/contact_model.dart';
import 'package:flutter/material.dart';

typedef clickFunction = void Function(int index);

class ContactWidget extends StatelessWidget {
  clickFunction clickOnDeleteIcon;
  ContactModel contactModel;

  ContactWidget({required this.contactModel, required this.clickOnDeleteIcon});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Visibility(
      visible: contactModel.name.isNotEmpty && contactModel.phone.isNotEmpty,
      child: Container(
        width: size.width,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${contactModel.name} ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'phone: ${contactModel.phone}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  clickOnDeleteIcon(contactModel.index);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ))
          ],
        ),
      ),
    );
  }
}
