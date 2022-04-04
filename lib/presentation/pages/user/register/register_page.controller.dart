import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/user/register/widgets/face_detection_result.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/user/register/widgets/face_detection_widget.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class RegisterPageController extends GetxController {
  static RegisterPageController get to => Get.find();

  final List<Widget> registerStepWidgets = [
    FaceDetectionWidget(),
    FaceDetectionResult()
  ];
  int currentStep = 0;
  Face? faceDetected;
  CameraImage? cameraImage;
  XFile? cameraFile;

  void nextStep() {
    currentStep += 1;
    update();
  }

  void setFaceAndImage(Face face, CameraImage image) {
    faceDetected = face;
    cameraImage = image;
    update();
  }

  void setCameraFile(XFile file) {
    cameraFile = file;
  }
}
