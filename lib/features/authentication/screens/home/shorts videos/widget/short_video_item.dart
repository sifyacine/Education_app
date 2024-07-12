import 'package:chewie/chewie.dart';
import 'package:education_app/common/widgets/home/channel.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class ShortVideoItem extends StatelessWidget {
  const ShortVideoItem(
      {super.key,
      required this.chewieController,
      required this.videoTitle,
      required this.imageName,
      required this.channelName});
  final ChewieController chewieController;
  final String videoTitle;
  final String imageName;
  final String channelName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Chewie(controller: chewieController),
        Positioned(
            right: 10,
            bottom: MediaQuery.sizeOf(context).height / 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: AssetImage(
                            imageName,
                          ),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 15,
                ),
                const LikeButton(
                  size: 45,
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.comment_outlined,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.save,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ],
            )),
        Positioned(
            bottom: 30,
            right: 10,
            left: 10,
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                Text(
                  videoTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    backgroundColor: Color.fromARGB(106, 207, 207, 207),
                    color: Colors.white,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
