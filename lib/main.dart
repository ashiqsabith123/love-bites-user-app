import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/send_otp/send_otp_bloc.dart';

import 'package:love_bites_user_app/presentation/screens/otp_auth_page/screen_otp_auth.dart';
import 'package:love_bites_user_app/presentation/screens/otp_verification_page/screen_otp_verification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<SendOtpBloc>(create: (ctx) => SendOtpBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Ubuntu'),
        home: ScreenOtpAuth(),
      ),
    );
  }
}
