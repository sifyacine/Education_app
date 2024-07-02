import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.red,
        width: double.infinity,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.home), Text("Home")],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.video_library_outlined), Text("Shorts")],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.add_box_outlined), Text("Push")],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.chat), Text("Chat gpt")],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.group_rounded), Text("Group")],
            ),
          ],
        ),
      ),
    );
  }
}
