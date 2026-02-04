import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unblockmycar/features/home/data/service/call_service.dart';

class CallProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  CallStatus _status = CallStatus.idle;
  CallStatus get status => _status;

  String? _callSid;
  String? get callSid => _callSid;

  //make a call
  Future<void> createCall({required String to}) async {
    _isLoading = true;
    _status = CallStatus.calling;
    notifyListeners();
    try {
      final response = await CallService().anonymousCall(to: to);
      if (response.statusCode == 200 || response.statusCode == 201) {
        _callSid = response.data["callSid"];
        _status = CallStatus.connected;
        log("📞 Call created: $_callSid");
        log("call created ");
      } else {
        _status = CallStatus.ended;
      }
    } catch (e) {
      _status = CallStatus.ended;
      log(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //end call
  Future<void> endCall() async {
    if (_callSid == null) return;
    _isLoading = true;

    notifyListeners();

    try {
      final response = await CallService().endCall(callSid: callSid!);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("call ended");
        _status = CallStatus.ended;
      } else {
        log("❌ Failed to end call: ${response.statusCode}");
      }
    } catch (e) {
      log(e.toString());
    } finally {
      _isLoading = false;
      _callSid = null;
      notifyListeners();
    }
  }
}

enum CallStatus { idle, calling, connected, ended }
