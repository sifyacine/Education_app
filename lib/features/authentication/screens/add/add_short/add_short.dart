import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

import '../../../../../utils/constants/colors.dart';
import 'description_page.dart';

class AddShortReelPage extends StatefulWidget {
  @override
  _AddShortReelPageState createState() => _AddShortReelPageState();
}

class _AddShortReelPageState extends State<AddShortReelPage> {
  final ImagePicker _picker = ImagePicker();
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  bool isRecording = false;
  XFile? videoFile;

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras != null && cameras!.isNotEmpty) {
        _cameraController = CameraController(cameras![0], ResolutionPreset.high);
        _cameraController!.initialize().then((_) {
          if (!mounted) return;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _pickFromGallery() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        videoFile = pickedFile;
      });
      _navigateToDescriptionPage(pickedFile);
    }
  }

  Future<void> _recordVideo() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      if (_cameraController!.value.isRecordingVideo) {
        XFile videoFile = await _cameraController!.stopVideoRecording();
        setState(() {
          isRecording = false;
          this.videoFile = videoFile;
        });
        _navigateToDescriptionPage(videoFile);
      } else {
        await _cameraController!.startVideoRecording();
        setState(() {
          isRecording = true;
        });
      }
    }
  }

  void _navigateToDescriptionPage(XFile videoFile) {
    Get.to(() => DescriptionPage(videoFile: videoFile));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _cameraController != null && _cameraController!.value.isInitialized
              ? SizedBox.expand(
            child: CameraPreview(_cameraController!),
          )
              : const Center(child: CircularProgressIndicator()),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.check, color: Colors.white, size: 30),
              onPressed: () {
                if (videoFile != null) {
                  _navigateToDescriptionPage(videoFile!);
                }
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: _pickFromGallery,
                  child: const Icon(Iconsax.gallery, color: Colors.white, size: 30),
                ),
                GestureDetector(
                  onTap: _recordVideo,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: isRecording ? TColors.primaryColor : Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        isRecording ? Iconsax.stop : Iconsax.video,
                        color: isRecording ? Colors.black : Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
