import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:love_bites_user_app/data/models/token_response_model/token_response_model.dart';
import 'package:love_bites_user_app/data/models/verify_otp_model/verify_otp_model.dart';
import 'package:love_bites_user_app/data/network/dio_network.dart';
import 'package:love_bites_user_app/util/api_end_points/api_end_points.dart';

class VerifyOtpDataProvider {
  final tokensStorage = new FlutterSecureStorage();
  final dio = getNetwork();
  Future<TokenResponseModel> verifyOtp(VerifyOtpModel verifyOtpModel) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await dio.post(ApiEndPoints.verifyOtpAndAuth,
          data: verifyOtpModel.toJson());

      if (response.statusCode == 200) {
        print(response.data.toString());
        return TokenResponseModel.fromJson(response.data);
      } else {
        //if any error
        return TokenResponseModel(status: 404, message: 'Something error1');
      }
    } on DioException catch (e) {
      if (e.response!.statusCode! >= 400) {
        return TokenResponseModel(
          status: e.response?.statusCode,
          message: e.response?.data['message'],
        );
      }
    } catch (e) {
      return TokenResponseModel(status: 404, message: 'Something error1 $e');
    }

    return TokenResponseModel();
  }
}
