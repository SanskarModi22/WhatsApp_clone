import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CameraView extends StatefulWidget {
  const CameraView({Key? key, this.path}) : super(key: key);
  final String? path;
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.crop_rotate),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.emoji_emotions_outlined,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.title),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        width: 100.w,
        height: 100.h,
        child: Stack(
          children: [
            Container(
              width: 100.w,
              height: 80.h,
              child: Image.file(
                File(widget.path.toString()),

                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: 100.w,
                color: Colors.black,
                padding: EdgeInsets.symmetric(
                  vertical: 5.sp,
                  horizontal: 6.sp,
                ),
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: CircleAvatar(
                      backgroundColor: Colors.teal[300],
                      child: IconButton(
                        icon:Icon(Icons.check),onPressed: (){},

                      ),
                      radius: 10.sp,
                    ),
                    prefixIcon: Icon(
                      Icons.add_photo_alternate_outlined,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                    border: InputBorder.none,
                    hintText: "Add a Caption..",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
