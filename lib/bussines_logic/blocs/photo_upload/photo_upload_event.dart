part of 'photo_upload_bloc.dart';

@immutable
sealed class PhotoUploadEvent {}

class SelectPhoto extends PhotoUploadEvent {
  int id;

  SelectPhoto({required this.id});
}

class DeleteImage extends PhotoUploadEvent {
  int id;
  String imagePath;

  DeleteImage({required this.id, required this.imagePath});
}

class UploadPhoto extends PhotoUploadEvent {}
