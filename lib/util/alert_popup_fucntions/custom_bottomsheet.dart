import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/user_details/user_details_bloc.dart';
import 'package:love_bites_user_app/core/constants/constants.dart';
import 'package:love_bites_user_app/data/models/date_of_birth_response_model/date_of_birth_response_model.dart';
import 'package:love_bites_user_app/presentation/common/validators/validator.dart';
import 'package:scroll_datetime_picker/scroll_datetime_picker.dart';

Future showCustomBottomSheet(BuildContext maincontext) async {
  String formattedDate = "";
  showModalBottomSheet(
      context: maincontext,
      builder: (context) {
        return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.8,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
            child: Column(
              children: [
                kHeightTwenty,
                kHeightTen,
                ScrollDateTimePicker(
                  style: DateTimePickerStyle(
                      centerDecoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 226, 201, 59)),
                              top: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 226, 201, 59)))),
                      activeStyle: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                      inactiveStyle: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 145, 145, 145))),
                  itemExtent: 48,
                  infiniteScroll: true,
                  onChange: (datetime) {
                    formattedDate = DateFormat('dd/MM/yyyy').format(datetime);
                  },
                  dateOption: DateTimePickerOption(
                    dateFormat: DateFormat('ddMMMyyyy'),
                    minDate: DateTime(1900, 1),
                    maxDate: DateTime.now(),
                    initialDate: DateTime(1998, 4, 5),
                  ),
                ),
                Align(
                  child: OkButton(onclick: () async {
                    maincontext.read<UserDetailsBloc>().add(GetDateOfBirth(
                        dateOfBirthResponseModel:
                            DateOfBirthResponseModel(dob: formattedDate)));

                    Navigator.pop(maincontext);
                  }),
                )
              ],
            ));
      });
}

class OkButton extends StatelessWidget {
  OkButton({super.key, required this.onclick});

  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
                onTap: onclick,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color.fromARGB(255, 226, 201, 59),
                  ),
                  width: screenSize.width / 3.5,
                  height: screenSize.height / 17,
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ok',
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
