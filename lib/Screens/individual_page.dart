import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/Models/chat_model.dart';
import 'package:sizer/sizer.dart';

class Individual extends StatefulWidget {
  final ChatModel? chatModel;
  Individual({this.chatModel});
  @override
  _IndividualState createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {
  FocusNode focusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            leadingWidth: 80,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_outlined),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blueAccent,
                    child: SvgPicture.asset(
                      widget.chatModel!.icon.toString(),
                      width: 35,
                      height: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel!.name.toString(),
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    "Last seen at ${widget.chatModel!.time}",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.videocam),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.call),
                onPressed: () {},
              ),
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text("View Contact"),
                    ),
                    PopupMenuItem(
                      child: Text("Media , links and docs"),
                    ),
                    PopupMenuItem(
                      child: Text("Whatsapp Web"),
                    ),
                    PopupMenuItem(
                      child: Text("Search"),
                    ),
                    PopupMenuItem(
                      child: Text("Mute Notifications"),
                    ),
                    PopupMenuItem(
                      child: Text("Wallpapers"),
                    ),
                  ];
                },
              ),
            ],
          ),
          body: Container(
            child: Stack(
              children: [
                ListView(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Container(
                        width: 85.w,
                        child: Card(
                          margin: EdgeInsets.fromLTRB(2, 0, 2, 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.attach_file)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.camera_alt)),
                                ],
                              ),
                              prefixIcon: IconButton(
                                icon: Icon(Icons.emoji_emotions_rounded),
                                onPressed: () {},
                              ),
                              hintText: "Type a message",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xFF128C7E),
                          child: IconButton(
                            icon: Icon(
                              Icons.mic_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
