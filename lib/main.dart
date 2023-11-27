import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/sign_up/sign_up_bloc.dart';
import 'package:love_bites_user_app/presentation/screens/login_page/screen_login.dart';
import 'package:love_bites_user_app/presentation/screens/otp_validation_page/screen_otp_validation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<SignUpBloc>(create: (ctx) => SignUpBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Kanit',
        ),
        home: ScreenLoginPage(),
      ),
    );
  }
}
