import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {super.key,
      required this.hint,
      required this.icon,
      required this.obscure});

  final String hint;
  final IconData icon;
  final bool obscure;
  //final TextEditingController controller;

  final OutlineInputBorder border = const OutlineInputBorder(
      borderSide:
          BorderSide(color: Color.fromARGB(255, 104, 104, 104), width: 2),
      borderRadius: BorderRadius.all(Radius.circular(10)));

  final UnderlineInputBorder underline = const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 3),
      borderRadius: BorderRadius.all(Radius.circular(9)));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
}

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          minimumSize: Size(MediaQuery.of(context).size.height * 1 / 3, 45),
          backgroundColor: const Color.fromARGB(255, 255, 131, 59)),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
