
import 'package:camera/camera.dart';
import 'package:education_app/features/authentication/screens/add/add_short/widgets/video_player.dart';
import 'package:flutter/material.dart';


class DescriptionPage extends StatelessWidget {
  final XFile videoFile;

  DescriptionPage({required this.videoFile});

  @override
  Widget build(BuildContext context) {
    TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Description'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: VideoPlayerWidget(videoFile: videoFile),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 12.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle the publish action
                  // Implement the logic to save the video with the description
                },
                child: const Text('Publish'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
