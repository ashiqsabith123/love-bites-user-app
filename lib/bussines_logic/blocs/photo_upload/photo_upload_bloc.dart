import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:love_bites_user_app/data/data_providers/upload_photos/upload_photos_provider.dart';
import 'package:love_bites_user_app/data/models/common_response_model/common_response_model.dart';
import 'package:meta/meta.dart';

part 'photo_upload_event.dart';
part 'photo_upload_state.dart';

class PhotoUploadBloc extends Bloc<PhotoUploadEvent, PhotoUploadState> {
  final ImagePicker picker = ImagePicker();
  List<File> photos = [];
  UploadPhotosDataProvider uploadPhotosDataProvider =
      UploadPhotosDataProvider();
  PhotoUploadBloc() : super(PhotoUploadInitial()) {
    on<SelectPhoto>((event, emit) async {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      photos.add(File(image!.path));
      emit(PhotoPickingState(id: event.id));
      await Future.delayed(const Duration(seconds: 1));
      emit(PhotoPickedState(photo: File(image.path), id: event.id));
    });

    on<DeleteImage>((event, emit) {
      photos.removeWhere(
        (element) => element.path == event.imagePath,
      );
      
      emit(DeleteImageState(id: event.id));
    });

    on<UploadPhoto>((event, emit) async {
      FormData formData = FormData();

      for (int i = 0; i < photos.length; i++) {
        // ignore: avoid_single_cascade_in_expression_statements
        formData
          ..files.add(MapEntry(
            "photos",
            await MultipartFile.fromFile(photos[i].path,
                filename: 'image {$i}',
                contentType: MediaType('image', 'jpeg')),
          ));
      }
      CommonResponseModel resp =
          await uploadPhotosDataProvider.uploadPhotos(formData);

      //print(formData.files);
    });
  }
}
