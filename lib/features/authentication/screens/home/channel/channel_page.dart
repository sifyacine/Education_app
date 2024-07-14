
import 'package:education_app/features/authentication/controllers/home/channel_page/channel_controller.dart';
import 'package:education_app/features/authentication/screens/home/channel/widgets/channel_professor.dart';
import 'package:education_app/features/authentication/screens/home/channel/widgets/channel_student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({super.key});


  @override
  Widget build(BuildContext context) {
    ChannelControllerImp channelControllerImp = Get.put(ChannelControllerImp());
    return DefaultTabController(
        length: 2,
        child: channelControllerImp.channelType == "professor"
            ? ChannelProfessor(channelControllerImp: channelControllerImp)
            : ChannelStudent(channelControllerImp: channelControllerImp));
  }
}
