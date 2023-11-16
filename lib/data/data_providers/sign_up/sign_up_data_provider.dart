import 'package:dio/dio.dart';
import 'package:love_bites_user_app/util/api_end_points/api_end_points.dart';

class SignUpDataProvider {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));


}
