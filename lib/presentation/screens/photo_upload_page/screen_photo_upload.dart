import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/photo_upload/photo_upload_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';
import 'package:love_bites_user_app/core/textstyles/style.dart';
import 'package:love_bites_user_app/presentation/screens/photo_upload_page/widgets/widgets.dart';
import 'package:love_bites_user_app/presentation/screens/user_preferences_page/screen_user_preferences.dart';
import 'package:love_bites_user_app/util/alert_popup_fucntions/custom_snackbar.dart';

class ScreenPhotoUpload extends StatelessWidget {
  ScreenPhotoUpload({super.key});

  Widget? image1;
  Widget? image2;
  Widget? image3;
  Widget? image4;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocListener<PhotoUploadBloc, PhotoUploadState>(
      listener: (context, state) {
        if (state is PhotoUploadedState) {
          if (state.resp.status == 201) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (ctx) {
              return ScreenUserPreferences();
            }));
          } else if (state.resp.status! >= 400) {
            showCustomSnackBar(
                context, 1, 'Something went wrong', state.resp.message!);
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
          child: Column(
            children: [
              BoldText(text: "It's all about", color: Colors.black),
              BoldText(text: 'presentation', color: Colors.black),
              kHeightTwenty,
              kHeightTwenty,
              BlocBuilder<PhotoUploadBloc, PhotoUploadState>(
                builder: (context, state) {
                  if (state is PhotoPickingState) {
                    switch (state.id) {
                      case 1:
                        image1 = const Loading();
                      case 2:
                        image2 = const Loading();
                    }
                  }
                  if (state is PhotoPickedState) {
                    switch (state.id) {
                      case 1:
                        image1 = ImageBorder(
                          id: 1,
                          image: state.photo,
                        );
                      case 2:
                        image2 = ImageBorder(
                          id: 2,
                          image: state.photo,
                        );
                    }
                  }

                  if (state is DeleteImageState) {
                    if (state.id == 1) {
                      image1 = null;
                    }
                    if (state.id == 2) {
                      image2 = null;
                    }
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectImage(
                        screenSize: screenSize,
                        statusWidget: image1,
                        onPressed: () {
                          context
                              .read<PhotoUploadBloc>()
                              .add(SelectPhoto(id: 1));
                        },
                      ),
                      SelectImage(
                        screenSize: screenSize,
                        statusWidget: image2,
                        onPressed: () {
                          context
                              .read<PhotoUploadBloc>()
                              .add(SelectPhoto(id: 2));
                        },
                      )
                    ],
                  );
                },
              ),
              kHeightTen,
              BlocBuilder<PhotoUploadBloc, PhotoUploadState>(
                builder: (context, state) {
                  if (state is PhotoPickingState) {
                    switch (state.id) {
                      case 3:
                        image3 = const Loading();
                      case 4:
                        image4 = const Loading();
                    }
                  }
                  if (state is PhotoPickedState) {
                    switch (state.id) {
                      case 3:
                        image3 = ImageBorder(
                          id: 3,
                          image: state.photo,
                        );
                      case 4:
                        image4 = ImageBorder(
                          id: 4,
                          image: state.photo,
                        );
                    }
                  }

                  if (state is DeleteImageState) {
                    if (state.id == 3) {
                      image3 = null;
                    }
                    if (state.id == 4) {
                      image4 = null;
                    }
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectImage(
                        screenSize: screenSize,
                        statusWidget: image3,
                        onPressed: () {
                          context
                              .read<PhotoUploadBloc>()
                              .add(SelectPhoto(id: 3));
                        },
                      ),
                      SelectImage(
                        screenSize: screenSize,
                        statusWidget: image4,
                        onPressed: () {
                          context
                              .read<PhotoUploadBloc>()
                              .add(SelectPhoto(id: 4));
                        },
                      )
                    ],
                  );
                },
              ),
              kHeightTwenty,
              const Text(
                'Upload at least 2 photos',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              kHeightTwenty,
              NextButton(onclick: () {
                context.read<PhotoUploadBloc>().add(UploadPhoto());
              })
            ],
          ),
        )),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: Color.fromARGB(255, 226, 201, 59),
        size: 35,
      ),
    );
  }
}
