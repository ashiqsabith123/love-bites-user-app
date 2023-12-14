part of 'photo_upload_bloc.dart';

@immutable
sealed class PhotoUploadEvent {}

class SelectPhoto extends PhotoUploadEvent {
  int id;

  SelectPhoto({required this.id});
}

class DeleteImage extends PhotoUploadEvent {
  int id;

  DeleteImage({required this.id});
}
