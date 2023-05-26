import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppFunction {
  //   static sendJson(jsonMap, page) async {
  //   var jsonData;
  //   var response;
  //   var jsonError = {
  //     'DocType': 'Error',
  //     'DocDate': DateTime.now().toString(),
  //     'Message': 'Check Internet Connection & try again - Server Error!'
  //   };
  //   try {
  //     // print(Constants.serverUrl);
  //     response = await http.post(
  //       Uri.parse('${Constants.serverUrl + page}.php'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: json.encode(jsonMap),
  //     );
  //     if (kDebugMode) {
  //       //print('-> ' +response.body);
  //     }
  //     // print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       try {
  //         jsonData = json.decode(response.body);
  //       } on FormatException catch (e) {
  //         return jsonError["Message"] =
  //             "Check Internet Connection & try again - ${e.message}";
  //       }
  //       return jsonData;
  //     } else {
  //       return jsonError["Message"] =
  //           "Check Internet Connection & try again - ${response.statusCode}";
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('EXP: ${e.toString()}');
  //     }
  //     return jsonError["Message"] =
  //         "Check Internet Connection & try again - ${e.toString()}";
  //   }
  // }

  static bool isMobile(String number) {
    return RegExp(r'^04([0-9]{8})$').hasMatch(number);
  }

  static bool isPhone(String number) {
    return RegExp(r'^02([0-9]{8})$').hasMatch(number);
  }

  static bool isEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool validatePassword(String value) {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        .hasMatch(value);
  }

  static Future<bool> isConnected() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  static String formatDate(
      {String pattern = 'dd-MMM-yyyy hh:mm:ss a', required String date}) {
    return DateFormat().format(DateTime.parse(date));
  }

  static bool checkMedicareNo(String medicareNo) {
    if (checkNumber(medicareNo) == false) {
      return (false);
    }
    if (medicareNo.length == 10) {
      List<int> weight = [1, 3, 7, 9, 1, 3, 7, 9];

      int checkDigit = int.parse(medicareNo.substring(8, 9));
      int sum = 0;
      for (int i = 0; i < 8; i++) {
        sum += int.parse(medicareNo.substring(i, i + 1)) * weight[i];
      }
      return ((sum % 10) == checkDigit);
    }
    return (false);
  }

  static bool checkNumber(String text) {
    if (text.contains('+')) {
      return false;
    }
    if (text.contains('-')) {
      return false;
    }
    if (text.contains('.')) {
      return false;
    }
    if (!text.isNum) {
      return false;
    }
    if (int.parse(text) <= 0) {
      return false;
    }

    return true;
  }

  // static Future<List<Suburb>> getSuburb(String val) async {
  //   var jsonData;
  //   List<Suburb> listC = List.empty(growable: true);
  //   if (val.length > 1) {
  //     String url = '${Constants.serverUrl}suburb_get.php';
  //     var jsonMap = {
  //       'DocType': 'GetSuburb',
  //       'DocDate': DateTime.now().toString(),
  //       'AppType': Platform.isIOS ? 'iOS' : 'Android',
  //       'AppKey': '132873',
  //       'Suburb': val
  //     };
  //     var res = await http.post(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: json.encode(jsonMap),
  //     );
  //     jsonData = json.decode(res.body);
  //     if (int.parse(jsonData["Total"]) > 0) {
  //       var rest = jsonData["Suburb"] as List;
  //       listC = rest.map<Suburb>((json) => Suburb.fromJson(json)).toList();
  //     }
  //   }
  //   return listC.toList();
  // }

  // static Future<List<Family>> getPatient({bool isBooking = true}) async {
  //   List<Family> listC = List.empty(growable: true);
  //   var msgResult = "";
  //   var response;
  //   try {
  //     var jsonMap = {
  //       'DocType': 'GetFamily',
  //       'DocDate': DateTime.now().toString(),
  //       'AppType': Platform.isIOS ? 'IOS' : 'Android',
  //       'AppKey': Constants.appKey,
  //       'UserID': Constants.userID
  //     };
  //     response = await Functions.sendJson(jsonMap, 'family_get');
  //     if (response == '') {
  //       msgResult = "Can't Connect - Try again.";
  //       return listC;
  //     }
  //     if (response["DocType"] == "Error") {
  //       msgResult = response["Message"];
  //       return listC;
  //     }
  //     msgResult = "Success";
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   } finally {
  //     DialogUtils.hideProgressDialog();
  //     if (msgResult == 'Success') {
  //       if (int.parse(response["Total"]) > 0) {
  //         var rest = response["Family"] as List;
  //         listC = rest.map<Family>((json) => Family.fromJson(json)).toList();
  //         print(rest[0]);
  //       }
  //     } else if (msgResult == "Invalid Login Detail.") {
  //       DialogUtils.sessionErrorDialog();
  //     }
  //   }
  //   return listC;
  // }

  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static editingDelay(VoidCallback action) {
    Timer? timer;
    if (null != timer) {
      timer.cancel();
    }
    timer = Timer(const Duration(milliseconds: 800), action);
  }

  // static logout() async {
  //   var db = await SQLite.instance.database;
  //   db.rawQuery('UPDATE Patient SET AutoLogin = 0, TouchID = 0');

  //   Get.offAll(() => const LoginScr(), arguments: [0]);
  // }
}
