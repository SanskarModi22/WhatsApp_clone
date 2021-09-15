import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsapp_clone/Screens/Camera_view.dart';
import 'package:whatsapp_clone/Screens/video_view.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;
  Future<void>? cameraValue;
  bool isRecording = false;
  String? videoPath;
  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras![0], ResolutionPreset.max);
    cameraValue = controller!.initialize();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FutureBuilder(
          future: cameraValue,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(controller!);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            width: 100.w,
            color: Colors.black,
            padding: EdgeInsets.symmetric(
              horizontal: 4.sp,
              vertical: 4.sp,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.flash_off,
                        color: Colors.white,
                        size: 25.sp,
                      ),
                      onPressed: () {},
                    ),
                    GestureDetector(
                        onLongPress: () async {
                          await controller!.startVideoRecording();
                          setState(() {
                            isRecording = true;
                          });
                        },
                        onLongPressUp: () async {
                          final path = join(
                              (await getTemporaryDirectory()).path,
                              "${DateTime.now()}.mp4");
                          XFile videoFile =
                              await controller!.stopVideoRecording();
                          videoFile.saveTo(path!);
                          setState(() {
                            isRecording = false;

                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => VideoViewPage(
                                        path: path,
                                      )));
                        },
                        onTap: () {
                          if (!isRecording!) {
                            takePhoto(context);
                          }
                        },
                        child: isRecording!
                            ? Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 60.sp,
                              )
                            : Icon(
                                Icons.panorama_fish_eye_outlined,
                                color: Colors.white,
                                size: 60.sp,
                              )),
                    IconButton(
                      icon: Icon(
                        Icons.flip_camera_ios,
                        color: Colors.white,
                        size: 25.sp,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Hold for Video, tap for photo",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void takePhoto(BuildContext context) async {
    final path =
        join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    XFile picture = await controller!.takePicture();
    picture.saveTo(path);
    print(path.toString());

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraView(
                  path: path,
                )));
  }
}
