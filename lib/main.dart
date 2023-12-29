import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/otp_verification/otp_verification_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/photo_upload/photo_upload_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/send_otp/send_otp_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/user_details/user_details_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/user_prefrences/user_prefrences_bloc.dart';
import 'package:love_bites_user_app/presentation/screens/otp_auth_page/screen_otp_auth.dart';
import 'package:love_bites_user_app/presentation/screens/otp_verification_page/screen_otp_verification.dart';
import 'package:love_bites_user_app/presentation/screens/photo_upload_page/screen_photo_upload.dart';
import 'package:love_bites_user_app/presentation/screens/user_details_page/screen_user_details.dart';
import 'package:love_bites_user_app/presentation/screens/user_preferences_page/screen_user_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SendOtpBloc>(create: (ctx) => SendOtpBloc()),
        BlocProvider<OtpVerificationBloc>(
            create: (ctx) => OtpVerificationBloc()),
        BlocProvider<UserDetailsBloc>(create: (ctx) => UserDetailsBloc()),
        BlocProvider<PhotoUploadBloc>(create: (ctx) => PhotoUploadBloc()),
        BlocProvider<UserPrefrencesBloc>(create: (ctx) => UserPrefrencesBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Ubuntu'),
        home: ScreenPhotoUpload(),
      ),
    );
  }
}
