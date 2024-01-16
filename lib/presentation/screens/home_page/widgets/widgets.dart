import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:like_button/like_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/home_page/home_page_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';

List<Widget> tabs = const [
  FirstTab(),
  SecondTab(),
  ThirdTab(),
  FourthTab(),
  FifthTab()
];

final images = [
  Image.network(
      fit: BoxFit.fill,
      'https://images.pexels.com/photos/5609457/pexels-photo-5609457.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Image.network(
      fit: BoxFit.fill,
      'https://images.pexels.com/photos/4662997/pexels-photo-4662997.jpeg?auto=compress&cs=tinysrgb&w=600'),
  Image.network(
      fit: BoxFit.fill,
      'https://images.pexels.com/photos/10372537/pexels-photo-10372537.jpeg?auto=compress&cs=tinysrgb&w=600')
];

class ThirdTab extends StatelessWidget {
  const ThirdTab({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomePageBloc>().add(FetchMatches());
    final screenSize = MediaQuery.of(context).size;
    return Padding(
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
              child: Text(
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
                return Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.black, size: 80),
                      Text(
                        "Finding your perfect matches",
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                    dragStartBehavior: DragStartBehavior.down,
                    itemCount: 10,
                    itemBuilder: (count, index) {
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
                                      items: images,
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
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Parvathy K P,",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              kWidthTen,
                                              Text(
                                                "25",
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
                                                'Kottayam',
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
                                          const LikeButton(
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
                          kHeightFourty
                        ],
                      );
                    }),
              );
            },
          ),
        ],
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
