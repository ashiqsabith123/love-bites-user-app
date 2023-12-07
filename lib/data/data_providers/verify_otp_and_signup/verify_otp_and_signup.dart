import 'package:dio/dio.dart';
import 'package:love_bites_user_app/data/models/common_response_model/common_response_model.dart';
import 'package:love_bites_user_app/data/models/sign_up_model/sign_up_model.dart';
import 'package:love_bites_user_app/data/network/dio_network.dart';
import 'package:love_bites_user_app/util/api_end_points/api_end_points.dart';

class VerifyOtpAndSignUpDataProvider {
  final dio = getNetwork();

  Future<CommonResponseModel> verifyOtpAndSignUp(
      SignUpModel signUpModel) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await dio.post(ApiEndPoints.verifyOtpAndSignup,
          data: signUpModel.toJson());
      if (response.statusCode == 200) {
        return CommonResponseModel.fromJson(response.data);
      } else {
        //if any error
        return CommonResponseModel(status: 404, message: 'Something error1');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 ||
          e.response?.statusCode == 401 ||
          e.response?.statusCode == 403 ||
          e.response?.statusCode == 404 ||
          e.response?.statusCode == 500) {
        return CommonResponseModel(
          status: e.response?.statusCode,
          message: e.response?.data['message'],
        );
      }
    } catch (e) {
      return CommonResponseModel(status: 404, message: 'Something error1 $e');
    }

    return CommonResponseModel();
  }
}
