import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsapp_clone/Models/chat_model.dart';

class Button extends StatelessWidget {
  const Button({Key? key, this.icon,this.name}) : super(key: key);
  final IconData? icon;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xFF128C7E),
        child: Icon(this.icon,size: 3.5.h,color: Colors.white,),
        radius: 3.5.h,
      ),
      title: Text(
        this.name.toString(),
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),

    );
  }
}
