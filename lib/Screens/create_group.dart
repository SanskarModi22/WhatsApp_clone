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
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length+1,
              itemBuilder: (BuildContext context, int item) {
                if(item==0)
                {
                  return Container(
                    height: Group.length>0?10.h:1.2.h,
                  );
                }
                return Padding(
                  padding: EdgeInsets.fromLTRB(0, 1.h, 0, 0),
                  child: InkWell(
                    onTap: () {

                      if (contacts[item-1].select == false) {
                        setState(() {
                          contacts[item-1].select = true;
                          Group.add(contacts[item-1]);
                        });
                      } else {
                        setState(() {
                          contacts[item-1].select = false;
                          Group.remove(contacts[item-1]);
                        });
                      }
                    },
                    child: CustomCard(
                      contact: contacts[item-1],
                    ),
                  ),
                );
              }),
          Group.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 6.h,
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: contacts.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, int item) {

                            if (contacts[item].select) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    Group.remove(contacts[item]);
                                    contacts[item].select = false;
                                  });

                                },
                                child: AvatarCard(
                                  contact: contacts[item],
                                ),
                              );
                            } else
                              return Text("hello");
                          }),
                    ),
                    Divider(
                      thickness: 1.sp,
                      color: Colors.grey,
                    )
                  ],
                )
              : Text("hello")
        ],
      ),
    );
  }
}
