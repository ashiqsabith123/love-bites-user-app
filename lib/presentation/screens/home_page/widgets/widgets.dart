import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:like_button/like_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/Notifications/notifications_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/home_page/home_page_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';
import 'package:love_bites_user_app/data/models/match_response_model/data.dart'
    as match;
import 'package:love_bites_user_app/data/models/notification_model/data.dart'
    as intrest;


import 'package:love_bites_user_app/util/alert_popup_fucntions/custom_alert.dart';

List<Widget> tabs = [
  FirstTab(),
  SecondTab(),
  ThirdTab(),
  FourthTab(),
  FifthTab()
];

match.Data? matchedUsers;
intrest.Data? notification;
List<List<Widget>> images = [];

BuildContext? cont;

PageController pagecontroller = PageController();
int lastIndex = 0;

class ThirdTab extends StatelessWidget {
  ThirdTab({super.key});
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    cont = context;
    final screenSize = MediaQuery.of(context).size;
    return BlocListener<HomePageBloc, HomePageState>(
      listener: (context, state) {},
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2, left: 8),
              child: SizedBox(
                width: screenSize.width,
                height: screenSize.height / 13,
                // Adjust color as needed
                child: const Text(
                  'Discover',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
                if (state is FetchingMatches) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      kHeightFourty,
                      kHeightFourty,
                      kHeightFourty,
                      kHeightFourty,
                      kHeightFourty,
                      kHeightTwenty,
                      LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.black, size: 70),
                      const Text(
                        "Finding your perfect matches",
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  );
                }

                if (state is MadeIntrest) {
                  SmartDialog.show(builder: (context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                      child: Lottie.asset('assets/animations/Love_Beats.json',
                          repeat: false),
                    );
                  });

                  player.play(AssetSource('sounds/bubble.wav'));

                  Future.delayed(const Duration(milliseconds: 800), () {
                    pagecontroller.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.decelerate,
                    );

                    if (lastIndex < matchedUsers!.matchedUsers!.length - 1) {
                      lastIndex++;
                    }
                    SmartDialog.dismiss();
                  });
                }

                if (state is MatchesFetched) {
                  if (state.resp.status! >= 400) {
                    return CustomAlertDailogBox(screenSize: screenSize);
                  } else {
                    matchedUsers = state.resp.data;
                    images = state.images;
                  }
                }
                return Expanded(
                  child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      controller: pagecontroller,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 100,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 3,
                              child: Column(children: [
                                Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    width: screenSize.width,
                                    height: screenSize.height / 1.6,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: Carousel(
                                        autoScrollDuration:
                                            const Duration(seconds: 2),
                                        items: images[lastIndex],
                                        animationPageCurve: Curves.easeInOut,
                                        indicatorBarColor: Colors.transparent,
                                        isCircle: false,
                                        indicatorHeight: 3,
                                        height: double.infinity,
                                        indicatorBarHeight: 20,
                                        indicatorBarWidth: 100,
                                      ),
                                    )),
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  width: screenSize.width,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  matchedUsers!
                                                          .matchedUsers![
                                                              lastIndex]
                                                          .name ??
                                                      "helooo",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                kWidthTen,
                                                Text(
                                                  matchedUsers!
                                                          .matchedUsers![
                                                              lastIndex]
                                                          .age
                                                          .toString() ??
                                                      "helooo",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                            kHeightFive,
                                            Row(
                                              children: [
                                                const Icon(
                                                  FeatherIcons.mapPin,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  matchedUsers!
                                                          .matchedUsers![
                                                              lastIndex]
                                                          .place
                                                          .toString() ??
                                                      "helooo",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            BlocBuilder<HomePageBloc,
                                                HomePageState>(
                                              builder: (context, state) {
                                                if (state is MakingIntrest) {
                                                  return LoadingAnimationWidget
                                                      .hexagonDots(
                                                          color: Colors.white,
                                                          size: 30);
                                                }
                                                return LikeButton(
                                                  onTap: (onLikeButtonTapped) {
                                                    cont!
                                                        .read<HomePageBloc>()
                                                        .add(MakeIntrest(
                                                            recieverID: matchedUsers!
                                                                .matchedUsers![
                                                                    lastIndex]
                                                                .userId!));
                                                    return Future(() => true);
                                                  },
                                                  size: 35,
                                                );
                                              },
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  FeatherIcons.x,
                                                  size: 30,
                                                  color: Colors.red,
                                                ))
                                          ],
                                        )
                                      ]),
                                ),
                              ]),
                            ),
                          ],
                        );
                      }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondTab extends StatelessWidget {
  const SecondTab({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    context.read<NotificationsBloc>().add(GetNotification());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: const Text(
              'Notifications',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          kHeightTwenty,
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: BlocBuilder<NotificationsBloc, NotificationsState>(
              builder: (context, state) {
                if (state is NotificationFetchingState) {
                  return Align(
                    alignment: AlignmentDirectional.center,
                    child: LoadingAnimationWidget.waveDots(
                        color: Colors.black, size: 30),
                  );
                }
                if (state is NotificationFetchedState) {
                  if (state.resp.data!.notifications == null) {
                    return Text('No notifications');
                  }
                  if (state.resp.data!.notifications==null) {
                    return CustomAlertDailogBox(screenSize: screenSize);
                  } else {
                    notification = state.resp.data;
                  }
                }
                return ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    //  shrinkWrap: true,
                    itemBuilder: (contxt, index) {
                      if (notification?.notifications?[index].status == "P") {
                        return IntrestRequestTile(
                          name: notification?.notifications?[index].name,
                          image: notification?.notifications?[index].image,
                          time: notification?.notifications?[index].time,
                        );
                      } else if (notification?.notifications?[index].status ==
                          "A") {
                        return RequestAcceptedTile(
                          name: notification?.notifications?[index].name,
                          image: notification?.notifications?[index].image,
                          time: notification?.notifications?[index].time,
                        );
                      }
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: notification?.notifications?.length ?? 2);
              },
            ),
          ))
        ],
      ),
    );
  }
}

class IntrestRequestTile extends StatelessWidget {
  const IntrestRequestTile(
      {super.key, required this.name, required this.image, required this.time});

  final String? name;
  final String? image;
  final String? time;

  @override
  Widget build(BuildContext context) {
    String urls =
        'https://love-bites-bucket.s3.us-east-2.amazonaws.com/$image.jpeg';
    return ListTile(
      leading: ClipOval(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30,
          child: Center(
            child: SizedBox(
              width: 80, // Double the radius to make it a square container
              height: 80, // Double the radius to make it a square container
              child: CachedNetworkImage(
                colorBlendMode: BlendMode.clear,
                fit: BoxFit
                    .cover, // Ensure the image covers the entire square container
                imageUrl: urls,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    LoadingAnimationWidget.hexagonDots(
                        color: Colors.black, size: 50),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
      title: Text(
        name ?? "Unknown",
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Made an intrest on you",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          kHeightFive,
          Text(
            time ?? "Unknown",
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FeatherIcons.check,
                  color: Colors.green,
                )),
            Text(
              "Accept",
              style: TextStyle(fontSize: 7),
            )
          ]),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FeatherIcons.x,
                    color: Colors.red,
                  )),
              Text(
                "Decline",
                style: TextStyle(fontSize: 7),
              )
            ],
          )
        ],
      ),
    );
  }
}

class RequestAcceptedTile extends StatelessWidget {
  const RequestAcceptedTile(
      {super.key, required this.name, required this.image, required this.time});

  final String? name;
  final String? image;
  final String? time;
  @override
  Widget build(BuildContext context) {
    String urls =
        'https://love-bites-bucket.s3.us-east-2.amazonaws.com/$image.jpeg';
    return ListTile(
        contentPadding: EdgeInsets.only(right: 20, left: 15),
        leading: ClipOval(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30,
            child: Center(
              child: SizedBox(
                width: 80, // Double the radius to make it a square container
                height: 80, // Double the radius to make it a square container
                child: CachedNetworkImage(
                  colorBlendMode: BlendMode.clear,
                  fit: BoxFit
                      .cover, // Ensure the image covers the entire square container
                  imageUrl: urls,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      LoadingAnimationWidget.hexagonDots(
                          color: Colors.black, size: 50),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          name ?? "Unknown",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Accepted your interest request",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            kHeightFive,
            Text(
              time ?? "Unknown",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              FeatherIcons.eye,
              color: Color.fromARGB(255, 29, 28, 69),
            )));
  }
}

class FirstTab extends StatelessWidget {
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(']][[]]'),
      ),
    );
  }
}

class FourthTab extends StatelessWidget {
  const FourthTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: const Text(
              'Chats',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          kHeightTwenty,
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 204, 204, 204),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Add functionality for the clear/search button if needed
                            },
                            icon: const Icon(
                              FeatherIcons.x,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    kHeightTwenty,
                    Text('R E C E N T'),
                    kHeightTen,
                    Container(
                      height: screenSize.height / 7,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemExtent: 95,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    'https://images.pexels.com/photos/6948652/pexels-photo-6948652.jpeg?auto=compress&cs=tinysrgb&w=600'),
                              ),
                              SizedBox(height: 8),
                              Text('Ashiq'),
                            ],
                          );
                        },
                      ),
                    ),
                    Text('M E S S A G E S'),
                    kHeightTen,
                    ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true, // Important to add shrinkWrap property
                      itemCount: 30,
                      separatorBuilder: (context, index) => Divider(
                        thickness: 1,
                      ),
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.all(0),
                          horizontalTitleGap: 10,
                          title: Text('Ashiq Sabith'),
                          subtitle: Text('How are you'),
                          trailing: Column(
                            children: [Text("9:58")],
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/4754648/pexels-photo-4754648.jpeg?auto=compress&cs=tinysrgb&w=600'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FifthTab extends StatelessWidget {
  const FifthTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ppppppp'),
      ),
    );
  }
}
