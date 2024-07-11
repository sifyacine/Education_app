import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Members'),
      ),
      body: ListView.builder(
        itemCount: 12, // Replace with the actual number of members
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/user/profile_pic.avif'), // Replace with the actual image path or network image
            ),
            title: Text('Member $index'),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                // Implement the logic to remove the member
              },
            ),
          );
        },
      ),
    );
  }
}