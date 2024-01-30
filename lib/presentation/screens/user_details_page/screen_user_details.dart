import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/user_details/user_details_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/data/models/user_details_model/user_details_model.dart';
import 'package:love_bites_user_app/presentation/common/validators/validator.dart';
import 'package:love_bites_user_app/presentation/screens/photo_upload_page/screen_photo_upload.dart';
import 'package:love_bites_user_app/presentation/screens/user_details_page/widgets/widgets.dart';
import 'package:love_bites_user_app/util/alert_popup_fucntions/custom_bottomsheet.dart';
import 'package:love_bites_user_app/util/alert_popup_fucntions/custom_snackbar.dart';

class ScreenUserDetails extends StatelessWidget {
  ScreenUserDetails({super.key});

  TextEditingController fullnameContorller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  String? gender;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDetailsBloc, UserDetailsState>(
      listener: (context, state) {
        if (state is UserDetailsSavedState) {
          if (state.response.status == 201) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (ctx) {
              return ScreenPhotoUpload();
            }));
          } else if (state.response.status! >= 400) {
            showCustomSnackBar(
                context, 1, 'Something went wrong', state.response.message!);
          }
        }
      },
      child: Scaffold(
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
                  controller: fullnameContorller,
                  fieldName: 'Full name',
                  fieldType: TextInputType.name,
                ),
                kHeightTwenty,
                UserDetailsStack(
                  id: 2,
                  controller: emailController,
                  fieldName: 'Email',
                  fieldType: TextInputType.emailAddress,
                ),
                kHeightTwenty,
                BlocBuilder<UserDetailsBloc, UserDetailsState>(
                  builder: (context, state) {
                    if (state is LocationFetchedState) {
                      locationController = TextEditingController(
                        text:
                            '${state.locationResponseModel!.district}, ${state.locationResponseModel!.state}',
                      );
                      validator("", 3, context);
                    }
                    return UserDetailsStack(
                      fieldName: 'Location',
                      controller: locationController,
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
                      dobController = TextEditingController(
                          text: state.dateOfBirthResponseModel.dob);
                      validator("", 4, context);
                    }
                    return UserDetailsStack(
                      fieldName: 'Date of birth',
                      controller: dobController,
                      fieldType: TextInputType.datetime,
                      readOnly: true,
                      onTap: () {
                        showCustomBottomSheet(context);
                      },
                    );
                  },
                ),
                kHeightTwenty,
                buildGenderButton(
                  () {
                    gender = "M";
                    context.read<UserDetailsBloc>().add(SelectGender(id: 1));
                  },
                  () {
                    gender = 'F';
                    context.read<UserDetailsBloc>().add(SelectGender(id: 2));
                  },
                ),
                kHeightTwenty,
                BlocBuilder<UserDetailsBloc, UserDetailsState>(
                  builder: (context, state) {
                    if (state is ShowButtonState) {
                      if (state.showButton) {
                        return NextButton(
                          color: const Color.fromARGB(255, 226, 201, 59),
                          fontColor: Colors.white,
                          onclick: () {
                            context.read<UserDetailsBloc>().add(SaveUserDetails(
                                    userDetailsModel: UserDetailsModel(
                                  fullname: fullnameContorller.text.trim(),
                                  email: emailController.text.trim(),
                                  location: locationController.text.trim(),
                                  dob: dobController.text.trim(),
                                  gender: gender,
                                )));
                          },
                        );
                      }
                    }
                    if (state is UserDetailsSavingState) {
                      return LoadingAnimationWidget.inkDrop(
                        color: const Color.fromARGB(255, 226, 201, 59),
                        size: 35,
                      );
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
      ),
    );
  }
}
