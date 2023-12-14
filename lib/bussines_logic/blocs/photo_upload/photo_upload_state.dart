part of 'photo_upload_bloc.dart';

@immutable
sealed class PhotoUploadState {}

final class PhotoUploadInitial extends PhotoUploadState {}

final class PhotoPickingState extends PhotoUploadState {
  final int? id;
  PhotoPickingState({required this.id});
}

final class PhotoPickedState extends PhotoUploadState {
  final File photo;
  final int id;
  PhotoPickedState({required this.photo, required this.id});
}

final class DeleteImageState extends PhotoUploadState {
  int id;
  DeleteImageState({required this.id});
}
