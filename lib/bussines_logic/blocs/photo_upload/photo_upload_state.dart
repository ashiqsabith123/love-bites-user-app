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

final class PhotoUploadingState extends PhotoUploadState {}

final class PhotoUploadedState extends PhotoUploadState {
  final CommonResponseModel resp;

  PhotoUploadedState({required this.resp});
}

final class ShowButtonState extends PhotoUploadState {
  final bool showButton;

  ShowButtonState({required this.showButton});
}
