import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/domain/service/face/face_detector.service.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_button.dart';
import 'package:camera/camera.dart';
import 'package:flutter_jett_boilerplate/presentation/components/face_painter.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/user/register/register_page.controller.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'dart:math' as math;

class FaceDetectionWidget extends StatefulWidget {
  const FaceDetectionWidget({Key? key}) : super(key: key);

  @override
  State<FaceDetectionWidget> createState() => _FaceDetectionWidgetState();
}

class _FaceDetectionWidgetState extends State<FaceDetectionWidget> {
  CameraController? cameraController;
  Face? faceDetected;
  CameraImage? cameraImage;
  XFile? cameraFile;
  bool _detectingFaces = false;
  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  @override
  void dispose() {
    cameraController!.dispose();
    super.dispose();
  }

  initializeCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    CameraDescription description = cameras.firstWhere(
        (CameraDescription camera) =>
            camera.lensDirection == CameraLensDirection.front);
    CameraController cameraController = CameraController(
        description, ResolutionPreset.high,
        enableAudio: false);
    await cameraController.initialize();
    setState(() {
      this.cameraController = cameraController;
    });
    initiateFaceDetection(description);
  }

  initiateFaceDetection(CameraDescription cameraDescription) async {
    cameraController!.startImageStream((CameraImage image) async {
      if (_detectingFaces) return;

      _detectingFaces = true;
      List<Face> faces = await FaceDetectorService.detectFacesFromImage(
          image, cameraDescription.sensorOrientation);
      if (faces.isNotEmpty) {
        setState(() {
          faceDetected = faces[0];
          cameraImage = image;
        });
        RegisterPageController.to.setFaceAndImage(faceDetected!, cameraImage!);
        _detectingFaces = false;
      } else {
        setState(() {
          faceDetected = null;
        });
        _detectingFaces = false;
      }
    });
  }

  handleNextButtonClick() async {
    if (cameraController!.value.isTakingPicture) {
      return null;
    }
    cameraController!.stopImageStream();
    XFile file = await cameraController!.takePicture();
    RegisterPageController.to.setCameraFile(file);
    RegisterPageController.to.nextStep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _cameraPreview(),
          SizedBox(
            width: double.infinity,
            child: _header(),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButton(
          title: "Next",
          onPressed: () {
            handleNextButtonClick();
          },
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Ambil Foto",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _cameraPreview() {
    final width = MediaQuery.of(context).size.width;

    return cameraController == null
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : Transform.scale(
            scale: 1.0,
            child: AspectRatio(
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              child: OverflowBox(
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Container(
                    width: width,
                    height: width * cameraController!.value.aspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        CameraPreview(cameraController!),
                        faceDetected == null
                            ? SizedBox()
                            : CustomPaint(
                                painter: FacePainter(
                                  face: faceDetected!,
                                  imageSize: Size(
                                      cameraController!
                                          .value.previewSize!.height,
                                      cameraController!
                                          .value.previewSize!.width),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
