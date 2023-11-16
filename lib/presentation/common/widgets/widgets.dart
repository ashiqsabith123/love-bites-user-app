import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget customInputField(String hint, IconData icon, bool obscure,
    String? Function(String?) validator) {
  const UnderlineInputBorder underline = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 3),
      borderRadius: BorderRadius.all(Radius.circular(9)));

  return TextFormField(
    validator: validator,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    obscureText: obscure,
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        size: 30,
      ),
      prefixIconColor: Color.fromARGB(255, 255, 255, 255),
      hintText: hint,
      hintStyle: const TextStyle(
          fontSize: 17, color: Color.fromARGB(255, 255, 255, 255)),
      enabledBorder: underline,
      focusedBorder: underline,
      contentPadding: const EdgeInsets.symmetric(vertical: 18),
      border: underline,
    ),
  );
}

Widget authButton(BuildContext context, String text, GlobalKey<FormState> key) {
  return ElevatedButton(
    onPressed: () {
      key.currentState!.validate();
    },
    style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        minimumSize: Size(MediaQuery.of(context).size.height * 1 / 2.5, 50),
        backgroundColor: const Color.fromARGB(255, 255, 131, 59)),
    child: Text(
      text,
      style: const TextStyle(fontSize: 20),
    ),
  );
}

Widget customGoogleButton(BuildContext context) {
  return ElevatedButton.icon(
      style: TextButton.styleFrom(
          elevation: 10,
          shadowColor: const Color.fromARGB(0, 114, 114, 114),
          side: const BorderSide(
            color: Color.fromARGB(221, 127, 127, 127),
            width: 2,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          minimumSize: Size(
            MediaQuery.of(context).size.height * 1 / 4,
            45,
          ),
          backgroundColor: Color.fromARGB(255, 0, 0, 0)),
      onPressed: () {},
      icon: SvgPicture.asset(
        "assets/svg/google.svg",
        width: 27,
        height: 27,
      ),
      label: const Text(
        'Google',
        style: TextStyle(fontSize: 18),
      ));
}
