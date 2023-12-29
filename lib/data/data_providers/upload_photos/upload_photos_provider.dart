import 'package:dio/dio.dart';
import 'package:love_bites_user_app/data/models/common_response_model/common_response_model.dart';
import 'package:love_bites_user_app/data/network/dio_network.dart';
import 'package:love_bites_user_app/data/secure_data/secure_data.dart';
import 'package:love_bites_user_app/util/api_end_points/api_end_points.dart';

class UploadPhotosDataProvider {
  final dio = getNetwork();
  Future<CommonResponseModel> uploadPhotos(FormData form) async {
    try {
      String? token = await tokenStorage.read(key: 'token');
      final response = await dio.post(ApiEndPoints.uploadPhotos,
          options: Options(headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
          }),
          data: form);
      if (response.statusCode == 201) {
        return CommonResponseModel.fromJson(response.data);
      } else {
        //if any error
        return CommonResponseModel(status: 404, message: 'Something error1');
      }
    } on DioException catch (e) {
      if (e.response!.statusCode! >= 400) {
        return CommonResponseModel(
            status: e.response?.statusCode,
            message: e.response?.data['message'],
            error: e.response?.data['error']);
      }
    } catch (e) {
      return CommonResponseModel(status: 404, message: 'Something error1 $e');
    }

    return CommonResponseModel();
  }
}
