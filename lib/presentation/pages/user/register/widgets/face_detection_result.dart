import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/domain/service/camera/camera_service.dart';
import 'package:flutter_jett_boilerplate/domain/service/face/face_detector.service.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/user/register/register_page.controller.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image/image.dart' as imglib;

class FaceDetectionResult extends StatefulWidget {
  const FaceDetectionResult({Key? key}) : super(key: key);

  @override
  State<FaceDetectionResult> createState() => _FaceDetectionResultState();
}

class _FaceDetectionResultState extends State<FaceDetectionResult> {
  imglib.Image? image;
  List? feature;

  @override
  void initState() {
    super.initState();
    getImage();
    getFeature();
  }

  getImage() async {
    CameraImage cameraImage = RegisterPageController.to.cameraImage!;
    Face face = RegisterPageController.to.faceDetected!;
    imglib.Image croppedImageData =
        FaceDetectorService.cropFace(cameraImage, face);
    setState(() {
      image = croppedImageData;
    });
  }

  getFeature() async {
    CameraImage cameraImage = RegisterPageController.to.cameraImage!;
    Face face = RegisterPageController.to.faceDetected!;
    List feature = await FaceDetectorService.createFeature(cameraImage, face);
    setState(() {
      this.feature = feature;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPageController>(builder: (state) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Image.file(
              File(state.cameraFile!.path),
            ),
            image != null
                ? Image.memory(imglib.encodeJpg(image!) as Uint8List)
                : const SizedBox(),
            Text("${feature}"),
          ],
        ),
      );
    });
  }
}
