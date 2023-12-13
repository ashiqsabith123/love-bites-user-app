import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/user_details/user_details_bloc.dart';
import 'package:love_bites_user_app/presentation/common/validators/validator.dart';

class UserDetailsStack extends StatelessWidget {
  UserDetailsStack(
      {required this.fieldName,
      this.fieldType,
      this.onTap,
      this.controller,
      this.readOnly,
      this.id});

  int? id;

  final String fieldName;
  TextInputType? fieldType;
  void Function()? onTap;
  TextEditingController? controller;
  bool? readOnly;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Bottom container
        Container(
            width: screenSize.width,
            height: screenSize.height / 14.5,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Color.fromARGB(255, 91, 91, 91)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                )),
            child: Container(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  SizedBox(
                    width: screenSize.width / 1.4,
                    child: TextFormField(
                      //  key: phoneKey,
                      controller: controller,
                      // focusNode: focus,
                      onTap: onTap,
                      onChanged: (value) {
                        validator(value, id, context);
                      },
                      keyboardType: fieldType,
                      readOnly: readOnly ?? false,
                      cursorColor: const Color.fromARGB(255, 89, 31, 31),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 74, 74, 74),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            )),
        // Top container (overlapping)
        Positioned(
          left: 15,
          top: -16,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 12, right: 10, top: 8),
            child: Center(
                child: Text(
              fieldName,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            )),
          ),
        ),
        // Add more overlapping containers as needed
      ],
    );
  }
}

class GenderButton extends StatelessWidget {
  GenderButton({
    super.key,
    this.ontap1,
    this.ontap2,
    this.color1,
    this.color2,
    this.fontcolor1,
    this.fontcolor2,
  });

  void Function()? ontap1;
  void Function()? ontap2;

  final Color? color1;
  final Color? color2;

  final Color? fontcolor1;
  final Color? fontcolor2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 14.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: ontap1,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.37,
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                  color: color1,
                  border: Border.all(
                      width: 1, color: const Color.fromARGB(255, 226, 201, 59)),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
              child: Center(
                child: Text(
                  'Male',
                  style: TextStyle(
                    color: fontcolor1,
                    fontSize: 19.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: ontap2,
            child: Container(
              decoration: BoxDecoration(
                  color: color2,
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 226, 201, 59),
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              width: MediaQuery.of(context).size.width / 2.36,
              height: MediaQuery.of(context).size.height / 12,
              child: Center(
                child: Text(
                  'Female',
                  style: TextStyle(
                    color: fontcolor2,
                    fontSize: 19.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  NextButton(
      {super.key, this.onclick, required this.color, required this.fontColor});

  final VoidCallback? onclick;
  final Color color;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Align(
        alignment: Alignment.center,
        child: InkWell(
            onTap: onclick,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  color: color),
              width: screenSize.width / 2,
              height: screenSize.height / 14,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: fontColor),
                    ),
                  ],
                ),
              ),
            )));
  }
}

Widget buildGenderButton() {
  Color? color1;
  Color? color2;
  Color? fontcolor1;
  Color? fontcolor2;
  return BlocBuilder<UserDetailsBloc, UserDetailsState>(
    builder: (context, state) {
      if (state is GenderSelectedState) {
        validator("", 5, context);
        color1 = state.color1;
        color2 = state.color2;
        fontcolor1 = state.fontcolor1;
        fontcolor2 = state.fontcolor2;
      }
      return GenderButton(
        color1: color1,
        color2: color2,
        fontcolor1: fontcolor1,
        fontcolor2: fontcolor2,
        ontap1: () {
          context.read<UserDetailsBloc>().add(SelectGender(id: 1));
        },
        ontap2: () {
          context.read<UserDetailsBloc>().add(SelectGender(id: 2));
        },
      );
    },
  );
}
