import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_design/live_streaming_app/Constants/colors.dart';
import 'package:flutter_ui_design/live_streaming_app/Model/model.dart';
import 'package:flutter_ui_design/live_streaming_app/Model/stream_category.dart';
import 'package:flutter_ui_design/live_streaming_app/Screen/live_stream_screen.dart';
import 'package:flutter_ui_design/live_streaming_app/Screen/profile_detail_screen.dart';
import 'package:iconsax/iconsax.dart';

class StremingAppHomeScreen extends StatefulWidget {
  const StremingAppHomeScreen({super.key});

  @override
  State<StremingAppHomeScreen> createState() => _StremingAppHomeScreenState();
}

class _StremingAppHomeScreenState extends State<StremingAppHomeScreen> {
  String categoryes = "🎮Gaming"; // default
  List<StreamItems> stream = streamItems;
  @override
  void initState() {
    super.initState();
    // filter stream based on initial category
    stream = streamItems
        .where((element) =>
            element.category.toLowerCase() == categoryes.toLowerCase())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                headerParts(),
                const SizedBox(height: 30),
                // live creator and remaning all
                profile(size),
                // for cagegory
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.pinkAccent,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * 0.05,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: streamCategory.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            categoryes = streamCategory[index].title;
                            categoryes == ""
                                ? stream = streamItems
                                : stream = streamItems
                                    .where((element) =>
                                        element.category.toLowerCase() ==
                                        categoryes.toLowerCase())
                                    .toList();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          margin: const EdgeInsets.only(left: 12),
                          decoration: BoxDecoration(
                            color: categoryes == streamCategory[index].title
                                ? Colors.purpleAccent
                                : Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                streamCategory[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                // for category items,
                SizedBox(
                  height: size.height * 0.55,
                  width: double.infinity,
                  child: GridView.builder(
                    itemCount: stream.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final streamItems = stream[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LiveStreamScreen(streamItems: streamItems),
                            ),
                          );
                        },
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Hero(
                                      tag: streamItems.image,
                                      child: Image.network(
                                        streamItems.image,
                                        width: size.width * 0.47,
                                        height: size.height * 0.25,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 7,
                                    top: 7,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 10,
                                          sigmaY: 10,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 7,
                                            vertical: 4,
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.visibility_outlined,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(width: 3),
                                              Text(
                                                streamItems.viewer,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 7,
                                    right: 7,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 7,
                                        vertical: 2.5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text(
                                        "Live",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 7,
                                    left: 15,
                                    child: Text(
                                      streamItems.streamTitle,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileDetailScreen(
                                              stream: streamItems,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            streamItems.url,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          streamItems.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${streamItems.followers} Followers",
                                          style: const TextStyle(
                                            color: Colors.white60,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.more_vert,
                                        color: Colors.white60),
                                    const SizedBox(width: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 70,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      color: Colors.transparent,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Icon(
                                Iconsax.home5,
                                color: Colors.white,
                                size: 30,
                              ),
                              Positioned(
                                bottom: -15,
                                right: 0,
                                left: 0,
                                child: CircleAvatar(radius: 3),
                              )
                            ],
                          ),
                          Icon(
                            Iconsax.chart,
                            color: Colors.white60,
                            size: 30,
                          ),
                          SizedBox(width: 15),
                          Icon(
                            Iconsax.message,
                            color: Colors.white60,
                            size: 30,
                          ),
                          Icon(
                            Icons.person_2_outlined,
                            color: Colors.white60,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }

  SizedBox profile(Size size) {
    return SizedBox(
      height: size.height * 0.16,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: streamItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProfileDetailScreen(stream: streamItems[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      DecoratedBox(
                        // border and border color
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: streamItems[index].isLiveNow
                                ? Colors.red
                                : Colors.white38,
                            width: streamItems[index].isLiveNow ? 3 : 1,
                          ),
                        ),
                        // background color and iamge,
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: streamItems[index].color,
                          ),
                          child: Image.network(
                            streamItems[index].url,
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        streamItems[index].name,
                        style: TextStyle(
                          color: streamItems[index].isLiveNow
                              ? Colors.white
                              : Colors.white54,
                        ),
                      )
                    ],
                  ),
                  // live or not
                  streamItems[index].isLiveNow
                      ? Positioned(
                          top: 0,
                          right: -15,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 3),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "Live",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "GoLive",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),
          iconButton(Icons.nightlight_outlined),
          const SizedBox(width: 15),
          iconButton(Icons.notifications_outlined),
          const SizedBox(width: 15),
          iconButton(Icons.search),
        ],
      ),
    );
  }

  CircleAvatar iconButton(icon) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: kSecondarybgColor,
      child: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
