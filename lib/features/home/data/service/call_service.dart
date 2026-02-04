import 'package:dio/dio.dart';
import 'package:unblockmycar/core/services/api_services.dart';
import 'package:unblockmycar/core/utils/urls/api_endpoints.dart';

class CallService {
  //create a call
  Future<Response> anonymousCall({required String to}) async {
    final response = await ApiServices.post(ApiEndpoints.call, {"to": to});
    return response;
  }

  /// End call
  Future<Response> endCall({required String callSid}) async {
    final response = await ApiServices.post(ApiEndpoints.callEnd, {
      "callSid": callSid,
    });
    return response;
  }
}
