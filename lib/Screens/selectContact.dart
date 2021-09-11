import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsapp_clone/Models/chat_model.dart';
import 'package:whatsapp_clone/Screens/create_group.dart';
import 'package:whatsapp_clone/UI/button.dart';
import 'package:whatsapp_clone/UI/contact_card.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contacts",
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "200 Contacts",
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search), iconSize: 20.sp, onPressed: () {}),
          PopupMenuButton<String>(
              iconSize: 20.sp,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text(
                      "Invite a friend",
                    ),
                  ),
                  PopupMenuItem(
                    child: Text("Contacts"),
                  ),
                  PopupMenuItem(
                    child: Text("Refresh"),
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                  ),
                ];
              })
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (BuildContext context, int item) {
            if (item == 0) {
              return Padding(
                padding: EdgeInsets.fromLTRB(0, 1.h, 0, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => CreateGroup(),
                      ),
                    );
                  },
                  child: Button(icon: Icons.group, name: "New Group"),
                ),
              );
            }
            if (item == 1) {
              return Padding(
                padding: EdgeInsets.fromLTRB(0, 1.h, 0, 0),
                child: InkWell(
                  onTap: () {},
                  child: Button(icon: Icons.person_add, name: "Add Contact"),
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.fromLTRB(0, 1.h, 0, 0),
              child: CustomCard(
                contact: contacts[item - 2],
              ),
            );
          }),
    );
  }
}
