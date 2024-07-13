import 'package:flutter/material.dart';

class CreateVideoBottomSheet extends StatefulWidget {
  final Function(double) onUploadComplete;

  CreateVideoBottomSheet({required this.onUploadComplete});

  @override
  _CreateVideoBottomSheetState createState() => _CreateVideoBottomSheetState();
}

class _CreateVideoBottomSheetState extends State<CreateVideoBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  bool isUploading = false;

  void _uploadVideo() async {
    setState(() {
      isUploading = true;
    });

    // Simulate video upload
    for (double progress = 0.1; progress <= 1.0; progress += 0.1) {
      await Future.delayed(const Duration(seconds: 1));
      widget.onUploadComplete(progress);
      setState(() {});
    }

    setState(() {
      isUploading = false;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Create a Video",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.0),
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Video Title"),
          ),
          const SizedBox(height: 16.0),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.video_call, size: 50),
                onPressed: () {
                  // Handle video upload
                },
              ),
              const Text("upload video", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isUploading ? null : _uploadVideo,
              child: isUploading
                  ? const CircularProgressIndicator()
                  : const Text("Upload"),
            ),
          ),

        ],

      ),
    );
  }
}
