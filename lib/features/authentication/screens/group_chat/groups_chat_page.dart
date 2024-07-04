import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';


class GroupsScreen extends StatelessWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text("Chats"),
      ),
      body: Center(
        child: Text(
          'No group chat is available',
        )
      )

    );
  }
}
