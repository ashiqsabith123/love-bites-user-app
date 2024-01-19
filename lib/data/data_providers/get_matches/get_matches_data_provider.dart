import 'package:dio/dio.dart';
import 'package:love_bites_user_app/data/models/match_response_model/match_response_model/match_response_model.dart';
import 'package:love_bites_user_app/data/network/dio_network.dart';
import 'package:love_bites_user_app/util/api_end_points/api_end_points.dart';
import 'package:love_bites_user_app/data/secure_data/secure_data.dart';

class GetMathcesProvider {
  final dio = getNetwork();

  Future<MatchResponseModel> getMatches() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      String? token = await tokenStorage.read(key: 'token');
      final response = await dio.get(
        ApiEndPoints.getMatches,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      if (response.statusCode == 200) {
        return MatchResponseModel.fromJson(response.data);
      } else {
        //if any error
        return MatchResponseModel(status: 404, message: 'Something error1');
      }
    } on DioException catch (e) {
      if (e.response!.statusCode! >= 400) {
        return MatchResponseModel(
          status: e.response?.statusCode,
          message: e.response?.data['message'],
        );
      }
    } catch (e) {
      return MatchResponseModel(status: 404, message: 'Something error1 $e');
    }

    return MatchResponseModel();
  }
}
