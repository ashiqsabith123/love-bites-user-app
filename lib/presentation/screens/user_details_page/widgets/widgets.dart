import 'package:flutter/material.dart';

class UserDetailsStack extends StatelessWidget {
  UserDetailsStack(
      {required this.fieldName,
      this.fieldType,
      this.onTap,
      this.controller,
      this.readOnly});
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
            height: screenSize.height / 13,
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
                      // validator: phoneValidator,
                      onTap: onTap,
                      keyboardType: fieldType,
                      readOnly: readOnly ?? false,
                      cursorColor: const Color.fromARGB(255, 89, 31, 31),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 74, 74, 74),
                        fontSize: 19.5,
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
            padding: const EdgeInsets.only(left: 12, right: 10, top: 8),
            color: Colors.white,
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
