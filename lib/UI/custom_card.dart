import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Models/chat_model.dart';
import 'package:whatsapp_clone/Screens/individual_page.dart';

class CustomCard extends StatelessWidget {
  final ChatModel? chatmodel;

  CustomCard({this.chatmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Individual(
                      chatModel: chatmodel,
                    ),),);
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueAccent,
              child: SvgPicture.asset(
                chatmodel!.icon.toString(),
                width: 35,
                height: 35,
                color: Colors.white,
              ),
            ),
            title: Text(
              chatmodel!.name.toString(),
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: Text(chatmodel!.time.toString()),
            subtitle: Row(
              children: [
                Icon(
                  Icons.done_all,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 3.0,
                ),
                Text(chatmodel!.currentMessage.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 0, 20, 0),
            child: Divider(
              thickness: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
