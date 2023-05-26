import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../res/app_url.dart';

class AuthRepository {
  BaseApiService baseApiService = NetworkApiService();
  Future<dynamic> loginApi(data) async {
    try {
      dynamic response =
          await baseApiService.postApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(data) async {
    try {
      dynamic response =
          await baseApiService.postApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
