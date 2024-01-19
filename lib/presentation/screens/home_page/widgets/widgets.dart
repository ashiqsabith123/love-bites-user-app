import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:like_button/like_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/home_page/home_page_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';
import 'package:love_bites_user_app/data/models/match_response_model/match_response_model/data.dart';
import 'package:love_bites_user_app/util/alert_popup_fucntions/custom_alert.dart';

List<Widget> tabs = [
  FirstTab(),
  SecondTab(),
  ThirdTab(),
  FourthTab(),
  FifthTab()
];

Data? matchedUsers;
List<List<Widget>> images = [];

BuildContext? cont;

PageController pagecontroller = PageController();
int lastIndex = 0;

class ThirdTab extends StatelessWidget {
  ThirdTab({super.key});

  @override
  Widget build(BuildContext context) {
    cont = context;
    final screenSize = MediaQuery.of(context).size;
    return BlocListener<HomePageBloc, HomePageState>(
      listener: (context, state) {
        if (state is MatchesFetched) {
          if (state.resp.status! >= 400) {
            showCustomErrorAlertDalog(
                context, "Error fectching mathches", " Please try again");
          }
        }
      },
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
                  Future.delayed(const Duration(seconds: 1), () {
                    pagecontroller.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.decelerate,
                    );

                    if (lastIndex < matchedUsers!.matchedUsers!.length - 1) {
                      lastIndex++;
                    }
                  });
                }

                if (state is MatchesFetched) {
                  if (state.resp.status! >= 400) {
                    return Column(
                      children: [
                        kHeightFourty,
                        Text(
                          'Something went wrong',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    );
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
                      itemCount: matchedUsers?.matchedUsers?.length,
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
                                                  style: TextStyle(
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
                                                Icon(
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
                                                  style: TextStyle(
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
                                            LikeButton(
                                              onTap: (onLikeButtonTapped) {
                                                cont!.read<HomePageBloc>().add(
                                                    MakeIntrest(
                                                        recieverID:
                                                            matchedUsers!
                                                                .matchedUsers![
                                                                    lastIndex]
                                                                .userId!));
                                                return Future(() => true);
                                              },
                                              size: 35,
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
    return Scaffold(
        // body: RecipeCard(),
        );
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
  const FourthTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ppppppp'),
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
