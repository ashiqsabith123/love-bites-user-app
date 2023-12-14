import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'photo_upload_event.dart';
part 'photo_upload_state.dart';

class PhotoUploadBloc extends Bloc<PhotoUploadEvent, PhotoUploadState> {
  final ImagePicker picker = ImagePicker();
  PhotoUploadBloc() : super(PhotoUploadInitial()) {
    on<SelectPhoto>((event, emit) async {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      emit(PhotoPickingState(id: event.id));
      await Future.delayed(const Duration(seconds: 1));
      emit(PhotoPickedState(photo: File(image!.path), id: event.id));
    });

    on<DeleteImage>((event, emit) {
      emit(DeleteImageState(id: event.id));
    });
  }
}
