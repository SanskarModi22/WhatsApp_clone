import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsapp_clone/Models/chat_model.dart';
import 'package:whatsapp_clone/UI/avatar_card.dart';
import 'package:whatsapp_clone/UI/button.dart';
import 'package:whatsapp_clone/UI/contact_card.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> Group = [];
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
                "New Group",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Add participants",
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
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF128C7E),
          onPressed: () {},
          child: Icon(Icons.arrow_forward),
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: Group.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (contacts[index - 1].select == true) {
                          Group.remove(contacts[index - 1]);
                          contacts[index - 1].select = false;
                        } else {
                          Group.add(contacts[index - 1]);
                          contacts[index - 1].select = true;
                        }
                      });
                    },
                    child: ContactCard(
                      contact: contacts[index - 1],
                    ),
                  );
                }),
            Group.length > 0
                ? Align(
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: contacts.length,
                              itemBuilder: (context, index) {
                                if (contacts[index].select == true)
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        Group.remove(contacts[index]);
                                        contacts[index].select = false;
                                      });
                                    },
                                    child: AvatarCard(
                                      contact: contacts[index],
                                    ),
                                  );
                                return Container();
                              }),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                    alignment: Alignment.topCenter,
                  )
                : Container(),
          ],
        ));
  }
}
