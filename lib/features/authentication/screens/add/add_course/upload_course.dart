import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import 'create_course.dart';


class AddVideoCoursePage extends StatefulWidget {
  @override
  _AddVideoCoursePageState createState() => _AddVideoCoursePageState();
}

class _AddVideoCoursePageState extends State<AddVideoCoursePage> {
  bool isVideoUploaded = false;
  double uploadProgress = 0.0;

  void _showCreateVideoBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery
              .of(context)
              .viewInsets
              .bottom),
          child: CreateVideoBottomSheet(
            onUploadComplete: (progress) {
              setState(() {
                uploadProgress = progress;
                isVideoUploaded = progress == 1.0;
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Videos Course"),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Spacer(),
            Positioned(
              bottom: 60.0, // Position it above the "Publish" button
              right: 16.0,
              child: FloatingActionButton(
                elevation: 0.0, // Set elevation to zero
                backgroundColor: TColors.primaryColor, // Set the background color to green
                onPressed: _showCreateVideoBottomSheet,
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(height: 18.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){},
                child: const Text("Publish"),
              ),
            ),

          ],

        ),
      ),
    );
  }
}