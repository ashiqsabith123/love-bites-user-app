import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/user_details/user_details_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/presentation/common/validators/validator.dart';
import 'package:love_bites_user_app/presentation/screens/user_details_page/widgets/widgets.dart';
import 'package:love_bites_user_app/util/alert_popup_fucntions/custom_bottomsheet.dart';

class ScreenUserDetails extends StatelessWidget {
  ScreenUserDetails({super.key});

  TextEditingController location = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fullname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: [
              BoldText(text: 'Tell us about', color: Colors.black),
              BoldText(text: 'yourself', color: Colors.black),
              kHeightTwenty,
              UserDetailsStack(
                id: 1,
                controller: fullname,
                fieldName: 'Full name',
                fieldType: TextInputType.name,
              ),
              kHeightTwenty,
              UserDetailsStack(
                id: 2,
                controller: email,
                fieldName: 'Email',
                fieldType: TextInputType.emailAddress,
              ),
              kHeightTwenty,
              BlocBuilder<UserDetailsBloc, UserDetailsState>(
                builder: (context, state) {
                  if (state is LocationFetchedState) {
                    location = TextEditingController(
                      text:
                          '${state.locationResponseModel!.state}, ${state.locationResponseModel!.district}',
                    );
                    validator("", 3, context);
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
              kHeightTwenty,
              BlocBuilder<UserDetailsBloc, UserDetailsState>(
                builder: (context, state) {
                  if (state is DateOfBirthFetchedState) {
                    dob = TextEditingController(
                        text: state.dateOfBirthResponseModel.dob);
                    validator("", 4, context);
                  }
                  return UserDetailsStack(
                    fieldName: 'Date of birth',
                    controller: dob,
                    fieldType: TextInputType.datetime,
                    readOnly: true,
                    onTap: () {
                      showCustomBottomSheet(context);
                    },
                  );
                },
              ),
              kHeightTwenty,
              buildGenderButton(),
              kHeightTwenty,
              BlocBuilder<UserDetailsBloc, UserDetailsState>(
                builder: (context, state) {
                  if (state is ShowButtonState) {
                    if (state.showButton) {
                      return NextButton(
                          color: Color.fromARGB(255, 226, 201, 59),
                          fontColor: Colors.white);
                    }
                  }
                  return NextButton(
                      color: Color.fromARGB(134, 223, 223, 223),
                      fontColor: Color.fromARGB(255, 159, 158, 158));
                  // color: const Color.fromARGB(255, 226, 201, 59),
                  // fontColor: Colors.white);
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
