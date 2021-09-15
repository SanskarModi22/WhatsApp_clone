import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/Models/chat_model.dart';
import 'package:sizer/sizer.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class Individual extends StatefulWidget {
  final ChatModel? chatModel;
  Individual({this.chatModel});
  @override
  _IndividualState createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {
  TextEditingController _controller = TextEditingController();
  bool show = false;
  FocusNode focusNode = new FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF128C7E),
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
            child: WillPopScope(
              child: Stack(
                children: [
                  ListView(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 85.w,
                              child: Card(
                                margin: EdgeInsets.fromLTRB(2, 0, 2, 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: TextField(
                                  controller: _controller,
                                  focusNode: focusNode,
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
                                          icon: Icon(Icons.attach_file),
                                          onPressed: () {
                                            print(1);
                                            showModalBottomSheet(
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder:
                                                    (BuildContext builder) =>
                                                        bottomSheet());
                                          },
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.camera_alt)),
                                      ],
                                    ),
                                    prefixIcon: IconButton(
                                      icon: Icon(Icons.emoji_emotions_rounded),
                                      onPressed: () {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        setState(() {
                                          show = !show;
                                        });
                                      },
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
                        show
                            ? Container(height: 34.h, child: EmojiSelected())
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          )),
    );
  }

  Widget EmojiSelected() {
    return EmojiPicker(
        config: Config(
          columns: 5,
        ),
        onEmojiSelected: (category, emoji) {
          setState(() {
            _controller.text += emoji.emoji;
          });
        });
  }

  Widget bottomSheet() {
    return Container(
        height: 34.h,
        width: 100.w,
        child: Card(
          margin: EdgeInsets.all(7.sp),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 3.h,
            ),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.fromLTRB(0,0,0,2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipIcon(
                        icon: Icons.insert_drive_file,
                        bg: Colors.indigo,
                        text: "Document",
                      ),
                      ClipIcon(
                        icon: Icons.camera_alt,
                        bg: Colors.pink,
                        text: "Camera",
                      ),
                      ClipIcon(
                        icon: Icons.insert_photo,
                        bg: Colors.purple,
                        text: "Gallery",
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipIcon(
                      icon: Icons.headset,
                      bg: Colors.orange,
                      text: "Audio",
                    ),
                    ClipIcon(
                      icon: Icons.location_pin,
                      bg: Colors.pink,
                      text: "Location",
                    ),
                    ClipIcon(
                      icon: Icons.person,
                      bg: Colors.blue,
                      text: "Contact",
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget ClipIcon({IconData? icon, String? text, Color? bg}) {
    return InkWell(
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: bg,
            child: IconButton(
              icon: Icon(icon),
              iconSize: 24.sp,
              color: Colors.white,
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(text!),
        ],
      ),
    );
  }
}
