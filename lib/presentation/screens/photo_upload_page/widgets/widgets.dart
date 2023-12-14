import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/photo_upload/photo_upload_bloc.dart';

class SelectImage extends StatelessWidget {
  SelectImage({
    super.key,
    required this.screenSize,
    this.statusWidget,
    this.onPressed,
  });

  final Size screenSize;

  Widget? statusWidget;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Adjust the border radius
      ),
      elevation: 5,
      child: Container(
        width: (screenSize.width - 80) / 2,
        height: screenSize.height / 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(56, 159, 158, 158)),
        child: statusWidget ??
            Center(
              child: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  FeatherIcons.plus,
                  size: 33,
                  color: Colors.black26,
                ),
              ),
            ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  NextButton({super.key, required this.onclick});

  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: InkWell(
                onTap: onclick,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color.fromARGB(255, 226, 201, 59),
                  ),
                  width: screenSize.width / 2,
                  height: screenSize.height / 14,
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}

class ImageBorder extends StatelessWidget {
  ImageBorder({super.key, required this.image, required this.id});

  File image;
  int id;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: FileImage(image), fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 3, right: 3),
            child: FloatingActionButton(
                backgroundColor: Colors.red,
                mini: true,
                onPressed: () {
                  context.read<PhotoUploadBloc>().add(DeleteImage(id: id));
                },
                child: Icon(
                  size: 15,
                  FeatherIcons.trash,
                )),
          ),
        ));
  }
}
