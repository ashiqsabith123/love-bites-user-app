import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:love_bites_user_app/bussines_logic/blocs/user_prefrences/user_prefrences_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';

List<String> height = [
  '4\'0"',
  '4\'1"',
  '4\'2"',
  '4\'3"',
  '4\'4"',
  '4\'5"',
  '4\'6"',
  '4\'7"',
  '4\'8"',
  '4\'9"',
  '4\'10"',
  '4\'11"',
  '5\'0"',
  '5\'1"',
  '5\'2"',
  '5\'3"',
  '5\'4"',
  '5\'5"',
  '5\'6"',
  '5\'7"',
  '5\'8"',
  '5\'9"',
  '5\'10"',
  '5\'11"',
  '6\'0"',
  '6\'1"',
  '6\'2"',
  '6\'3"',
  '6\'4"',
  '6\'5"',
  '6\'6"',
  '6\'7"',
  '6\'8"',
  '6\'9"',
  '6\'10"',
  '6\'11"',
  '7\'0"',
  '7\'1"',
  '7\'2"',
  '7\'3"',
  '7\'4"',
  '7\'5"',
  '7\'6"',
  '7\'7"',
  '7\'8"',
  '7\'9"',
  '7\'10"',
  '7\'11"',
  '8\'0"',
  '8\'1"',
  '8\'2"',
  '8\'3"',
  '8\'4"',
  '8\'5"',
  '8\'6"',
  '8\'7"',
  '8\'8"',
  '8\'9"',
  '8\'10"',
  '8\'11"',
];

List<String> status = [
  'Single',
  'Single with kids',
  'Divorced',
  'Divorced with kids',
  'Widowed',
  'Widowed with kids',
  'Separated',
  'Separeted with kids'
];

List<String> faith = [
  'Hindu',
  'Christian',
  'Muslim',
  'Aethist',
  'Spiritual',
  'Agnostic',
  'Buddhist',
  'Jewish',
  'Parsi',
  'Sikh',
  'Jain',
  'Bahai',
  'Other'
];

List<String> motherTounge = [
  'Malayalam',
  'English',
  'Hindi',
  'Tamil',
  'Telugu',
  'Kannada',
  'Marathi',
  'Urudu',
  'Assamese',
  'Bengali',
  'Bodo',
  'Dogri',
  'Gujarati',
  'Kashmiri',
  'Konkani',
  'Maithili',
  'Manipuri',
  'Nepali',
  'Odia',
  'Punjabi',
  'Sanskrit',
  'Santali',
  'Sindhi',
  'Urdu',
];

List<String> smoke = ['Yes', 'No', 'Planning to quit'];
List<String> alcohol = [
  'Regular',
  'Planning to quit',
  'Socially',
  'Occasionally',
  'Teetotaler'
];

List<String> settle = [
  'Within a year',
  'Within 2 years',
  'Within 3 years',
  'In 3+ years',
  'Undecided'
];

List<String> hobbies = [
  'Reading',
  'Cooking',
  'Photography',
  'Dancing',
];

List<String> tea = [
  'Cofee',
  'Tea',
  'Both',
  'Neither',
];

List<String> loveLanguage = [
  'Words of affirmation',
  'Acts of service',
  'Receiving gifts',
  'Quality time',
  'Physical touch',
];

List<Widget> listView = [
  CommonListView(
    array: height,
    text1: 'Whats\'s your',
    text2: 'height?',
  ),
  CommonListView(array: status, text1: 'Your status'),
  CommonListView(array: faith, text1: 'Your faith'),
  CommonListView(
    array: motherTounge,
    text1: 'Your Mother',
    text2: 'tounge',
  ),
  CommonListView(array: smoke, text1: 'Do you smoke?'),
  CommonListView(
    array: alcohol,
    text1: 'You drinking',
    text2: "habits",
  ),
  CommonListView(
    array: settle,
    text1: 'Settling down',
    text2: "plans",
  ),
  CommonListView(
    array: hobbies,
    text1: 'Do you have any',
    text2: 'favorite hobbies',
  ),
  CommonListView(
    array: tea,
    text1: 'Are you a coffee',
    text2: 'tea person?',
  ),
  CommonListView(
    array: loveLanguage,
    text1: "What's your",
    text2: 'love language?',
  ),
  const LastLoading()
];

List<String> details = [];

class CommonListView extends StatelessWidget {
  CommonListView(
      {super.key, required this.array, required this.text1, this.text2});

  List<String> array;
  String text1;
  String? text2;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BoldText(text: text1, color: Colors.black),
        if (text2 != null) BoldText(text: text2!, color: Colors.black),
        kHeightTwenty,
        kHeightTen,
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: List.generate(array.length, (index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 13,
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 0, 49, 14),
                          highlightColor: const Color.fromARGB(255, 0, 49, 14),
                          onTap: () {
                            details.add(array[index]);

                            Future.delayed(const Duration(milliseconds: 300),
                                () {
                              context
                                  .read<UserPrefrencesBloc>()
                                  .add(ChangeUserPrefrencePage());
                            });
                          },
                          child: Center(
                            child: Text(
                              array[index],
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LastLoading extends StatelessWidget {
  const LastLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoadingAnimationWidget.horizontalRotatingDots(
          color: const Color.fromARGB(255, 226, 201, 59),
          size: 100,
        ),
        const Text(
          'Creating your profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}

class NextButton extends StatelessWidget {
  NextButton({super.key, required this.onclick});

  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InkWell(
                onTap: onclick,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: primaryColor,
                  ),
                  width: screenSize.width / 1.25,
                  height: screenSize.height / 14,
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start Discovering',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
