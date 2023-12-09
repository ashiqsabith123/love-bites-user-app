import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:love_bites_user_app/presentation/common/validators/validator.dart';

class PhoneFiled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Phone number',
        hintText: '',
        labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black, // Border color
          ),
        ),
      ),
    );
  }
}

class NumberStack extends StatelessWidget {
  NumberStack({required this.phoneController, required this.focus});
  FocusNode focus;
  TextEditingController phoneController;
  // GlobalKey phoneKey;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Bottom container
        Container(
            width: screenSize.width,
            height: screenSize.height / 11,
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
                  const Text(
                    '+91',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 119, 118, 118),
                    ),
                    width: 1.5,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: screenSize.width / 1.7,
                    child: TextFormField(
                      //  key: phoneKey,
                      controller: phoneController,
                      focusNode: focus,
                      validator: phoneValidator,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      cursorColor: const Color.fromARGB(255, 89, 31, 31),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
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
            color: Colors.white,
            width: screenSize.width / 3.3,
            height: screenSize.height / 25,
            child: const Center(
                child: Text(
              'Phone number',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            )),
          ),
        ),
        // Add more overlapping containers as needed
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
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InkWell(
                onTap: onclick,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color.fromARGB(255, 226, 201, 59),
                  ),
                  width: screenSize.width / 2,
                  height: screenSize.height / 14,
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next',
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

GoogleAuthButton AuthButton() {
  return GoogleAuthButton(
    onPressed: () {},
    style: const AuthButtonStyle(
      buttonType: AuthButtonType.icon,
      padding: EdgeInsets.all(17),
      borderRadius: 50,
      textStyle: TextStyle(
          fontSize: 17, fontFamily: 'Ubuntu', fontWeight: FontWeight.w700),
    ),
  );
}
