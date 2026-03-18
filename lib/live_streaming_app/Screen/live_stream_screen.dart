import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_design/live_streaming_app/Model/model.dart';
import 'package:flutter_ui_design/live_streaming_app/Screen/profile_detail_screen.dart';

class LiveStreamScreen extends StatelessWidget {
  final StreamItems streamItems;
  const LiveStreamScreen({super.key, required this.streamItems});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: streamItems.image,
            child: Image.network(
              streamItems.image,
              fit: BoxFit.fitHeight,
              height: size.height,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 50,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfileDetailScreen(stream: streamItems),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        streamItems.url,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        streamItems.name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${streamItems.followers} Followers",
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(width: 15),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueAccent,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Text(
                      "Follow",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.visibility_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              streamItems.viewer,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 7),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                child: Text(
                                  "Live",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ClipRRect(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey.withAlpha(150),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "Comment...",
                                      hintStyle: TextStyle(color: Colors.white),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.purpleAccent,
                                  child: Transform.rotate(
                                    angle: 5.5,
                                    child: const Icon(
                                      Icons.send_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey.withAlpha(150),
                          child: const Icon(
                            Icons.share_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey.withAlpha(150),
                          child: const Icon(
                            Icons.favorite,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: size.height * 0.1,
                right: 15,
                left: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.all(7),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(10),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: Colors.white30,
                          backgroundImage: NetworkImage(
                              "https://symbl-cdn.com/i/webp/9c/4628a5e254c186333877e3449d1caf.webp"),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Sample User",
                              style: TextStyle(
                                color: Colors.white30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Welcome",
                              style: TextStyle(
                                color: Colors.white30,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  commonChatCard("Good Game!"),
                  commonChatCard("I love you❤️"),
                  commonChatCard("What is your favorite sports"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container commonChatCard(comment) {
    return Container(
      margin: const EdgeInsets.all(7),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(30),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
                "https://symbl-cdn.com/i/webp/9c/4628a5e254c186333877e3449d1caf.webp"),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Sample User",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                comment,
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
