import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsapp_clone/Models/chat_model.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key? key,this.contact}) : super(key: key);
  final ChatModel? contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            child: SvgPicture.asset(
              "assets/person.svg",
              color: Colors.white,
              width: 3.5.h,
              height: 3.5.h,
            ),
            radius: 3.5.h,
          ),
          Positioned(
            bottom: 0.5.sp,
            right: 0.5.sp,
            child: CircleAvatar(
              radius: 1.5.h,
              backgroundColor: Color(0xFF128C7E),
              child: Icon(Icons.clear),
            ),
          ),
        ],
      ),
    );
  }
}
