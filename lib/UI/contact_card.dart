import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsapp_clone/Models/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, this.contact}) : super(key: key);
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
          contact!.select
              ? Positioned(
                  bottom: 0.5.sp,
                  right: 0.5.sp,
                  child: CircleAvatar(
                    radius: 1.5.h,
                    backgroundColor: Color(0xFF128C7E),
                    child: Icon(Icons.check),
                  ),
                )
              : Positioned(
            bottom: 0.5.sp,
            right: 0.5.sp,
            child: CircleAvatar(
              radius: 1.5.h,
              backgroundColor: Colors.transparent,

            ),
          )
        ],
      ),
      title: Text(
        contact!.name.toString(),
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        contact!.status.toString(),
        style: TextStyle(
          fontSize: 13.sp,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
