import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/user_details/user_details_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/presentation/screens/user_details_page/widgets/widgets.dart';

class ScreenUserDetails extends StatelessWidget {
  ScreenUserDetails({super.key});

  TextEditingController? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              BoldText(text: 'Tell us about', color: Colors.black),
              BoldText(text: 'yourself', color: Colors.black),
              UserDetailsStack(
                fieldName: 'Full name',
                fieldType: TextInputType.name,
              ),
              kHeightTwenty,
              kHeightTen,
              UserDetailsStack(
                fieldName: 'Email',
                fieldType: TextInputType.emailAddress,
              ),
              kHeightTwenty,
              kHeightTen,
              BlocBuilder<UserDetailsBloc, UserDetailsState>(
                builder: (context, state) {
                  if (state is LocationFetchedState) {
                    location = TextEditingController(
                      text:
                          '${state.locationResponseModel!.state}, ${state.locationResponseModel!.district}',
                    );
                  }
                  return UserDetailsStack(
                    fieldName: 'Location',
                    controller: location,
                    fieldType: TextInputType.streetAddress,
                    readOnly: true,
                    onTap: () {
                      context.read<UserDetailsBloc>().add(GetLocation());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
