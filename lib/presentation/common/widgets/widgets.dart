import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget customInputField(String hint, IconData icon, bool obscure,
    String? Function(String?) validator, TextEditingController controller) {
  const UnderlineInputBorder underline = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 3),
      borderRadius: BorderRadius.all(Radius.circular(9)));

  return TextFormField(
    controller: controller,
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

Widget authButton(BuildContext context, String text, GlobalKey<FormState> key,
    Function() onpressed) {
  return ElevatedButton(
    onPressed: onpressed,
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

class CustomOtpField extends StatelessWidget {
  CustomOtpField({
    super.key,
    required this.next,
    required this.prev,
  });
  final bool next;
  final bool prev;
  UnderlineInputBorder underline = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 3),
      borderRadius: BorderRadius.all(Radius.circular(9)));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 50,
      child: TextFormField(
        decoration: InputDecoration(
          border: underline,
          enabledBorder: underline,
          focusedBorder: underline,
        ),
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && next == true) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && prev == true) {
            FocusScope.of(context).previousFocus();
          }
        },
        style: const TextStyle(fontSize: 30, color: Colors.white),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}

