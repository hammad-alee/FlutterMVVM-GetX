import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../res/app_color.dart';

class Utils {
  static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg, backgroundColor: Colors.red, toastLength: Toast.LENGTH_LONG);
  }

  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog(
      {isCancellable = false, text = "Loading Please Wait..."}) async {
    if (!isProgressVisible) {
      Get.dialog(Builder(builder: (context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(0.0),
          titlePadding: const EdgeInsets.all(0.0),
          contentPadding: const EdgeInsets.all(0.0),
          backgroundColor: Colors.transparent,
          content: Container(
            width: MediaQuery.of(context).size.width - 40 > 400
                ? 500
                : MediaQuery.of(context).size.width - 30,
            height: 150,
            //color: Colors.white,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 12,
                  margin: const EdgeInsets.only(left: 2, right: 2),
                  decoration: BoxDecoration(
                      color: AppColor.primaryLight,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  width: MediaQuery.of(context).size.width,
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Image.asset(
                        '',
                        fit: BoxFit.fitHeight,
                        height: 60,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.secondary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }), barrierDismissible: isCancellable);
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }

  // success dialog method
  static void successDialog(description, {Function()? onclick}) {
    if (onclick == null) {
      Get.back();
    }
    Get.dialog(Builder(builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(0.0),
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        content: Container(
          width: MediaQuery.of(context).size.width - 40 > 400
              ? 500
              : MediaQuery.of(context).size.width - 40,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 90,
                decoration: const BoxDecoration(
                    color: Color(0xff515c6f),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Lottie.asset(
                      'assets/anim/success.json',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Success!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.text1,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Text(
                  description,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    onPressed: onclick,
                    color: Colors.green,
                    height: 45,
                    minWidth: 150,
                    elevation: 6,
                    splashColor: AppColor.secondary,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Text(
                      "OK",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }), barrierDismissible: false);
  }

  static void errorDialog(description) {
    Get.dialog(Builder(builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(0.0),
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        content: Container(
          width: Get.width - 40 > 400 ? 500 : Get.width - 30,
          height: 240,
          //color: Colors.red,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                decoration: const BoxDecoration(
                    color: Color(0xff515c6f),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                width: Get.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Lottie.asset(
                      'assets/anim/error.json',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
              Text(
                'Oops...',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: AppColor.text1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  description,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColor.text1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.red,
                    height: 45,
                    minWidth: 150,
                    elevation: 6,
                    splashColor: AppColor.secondary,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Text(
                      "OK",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }), barrierDismissible: false);
  }

  static void sessionErrorDialog() {
    Get.dialog(Builder(builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(0.0),
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        content: Container(
          width: Get.width - 40 > 400 ? 500 : Get.width - 30,
          height: 240,
          //color: Colors.red,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                decoration: const BoxDecoration(
                    color: Color(0xff515c6f),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                width: Get.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Lottie.asset(
                      'assets/anim/war.json',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
              Text(
                'Session Expired!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: AppColor.text1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'You are logged out! Please Login again.',
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColor.text1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      //GlobalController.logout();
                    },
                    color: Colors.red,
                    height: 45,
                    minWidth: 150,
                    elevation: 6,
                    splashColor: AppColor.secondary,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Text(
                      "OK",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }), barrierDismissible: false);
  }

  // static void areaClosedDialog({description, confirmClick}) {
  //   GlobalController.canBookAgain.value = false;
  //   Get.dialog(Builder(builder: (context) {
  //     String strDigits(int n) => n.toString().padLeft(2, '0');
  //     return AlertDialog(
  //       backgroundColor: Colors.transparent,
  //       insetPadding: const EdgeInsets.all(0.0),
  //       titlePadding: const EdgeInsets.all(0.0),
  //       contentPadding: const EdgeInsets.all(0.0),
  //       content: Container(
  //         width: Get.width - 40,
  //         decoration: const BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.all(Radius.circular(20))),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             Container(
  //               height: 80,
  //               decoration: const BoxDecoration(
  //                   color: Color(0xff515c6f),
  //                   borderRadius: BorderRadius.only(
  //                       topRight: Radius.circular(20),
  //                       topLeft: Radius.circular(20))),
  //               width: Get.width,
  //               child: Center(
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(0.0),
  //                   child: Lottie.asset(CAsset.closedAnim,
  //                       width: 250, height: 250, fit: BoxFit.scaleDown),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 6,
  //             ),
  //             Text(
  //               'Not Open Yet.',
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w900,
  //                 color: CColor.text1,
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8),
  //               child: Text(
  //                 description,
  //                 maxLines: 5,
  //                 textAlign: TextAlign.center,
  //                 overflow: TextOverflow.ellipsis,
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.normal,
  //                   color: CColor.text1,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               //width: 100,
  //               padding:
  //                   const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
  //               // decoration: BoxDecoration(
  //               //     border: Border.all(color: CColor.secondary),
  //               //     borderRadius: BorderRadius.circular(15)),
  //               child: Center(
  //                 child: Obx(() => Text(
  //                       GlobalController.canBookAgain.value == true
  //                           ? 'You can Book Now!'
  //                           : 'You can confirm after : ${strDigits(GlobalController.myDuration.value.inHours.remainder(60))}:${strDigits(GlobalController.myDuration.value.inMinutes.remainder(60))}:${strDigits(GlobalController.myDuration.value.inSeconds.remainder(60))}',
  //                       style: TextStyle(
  //                         color: GlobalController.canBookAgain.value == true
  //                             ? Colors.green
  //                             : Colors.red,
  //                         fontFamily: "Source Sans Pro",
  //                         fontSize: 18,
  //                       ),
  //                     )),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 5,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 10),
  //                   child: Obx(() => MaterialButton(
  //                         onPressed: confirmClick,
  //                         color: CColor.primary,
  //                         height: 45,
  //                         minWidth: 120,
  //                         elevation: 6,
  //                         splashColor:
  //                             GlobalController.canBookAgain.value == true
  //                                 ? CColor.secondary
  //                                 : Colors.grey,
  //                         textColor: Colors.white,
  //                         shape: const RoundedRectangleBorder(
  //                             borderRadius:
  //                                 BorderRadius.all(Radius.circular(30))),
  //                         child: const Text(
  //                           "Book Now",
  //                           style: TextStyle(
  //                               fontSize: 15, fontWeight: FontWeight.w800),
  //                         ),
  //                       )),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 10),
  //                   child: MaterialButton(
  //                     onPressed: () {
  //                       //GlobalController.stopTimer();
  //                       Navigator.pop(context);
  //                       //Get.back();
  //                     },
  //                     color: CColor.secondary,
  //                     height: 45,
  //                     minWidth: 120,
  //                     elevation: 6,
  //                     splashColor: Colors.red,
  //                     textColor: Colors.white,
  //                     shape: const RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(30))),
  //                     child: const Text(
  //                       "Discard",
  //                       style: TextStyle(
  //                           fontSize: 15, fontWeight: FontWeight.w800),
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }), barrierDismissible: false);
  // }

  static void infoDialog(
      {String? title, required String desc, void Function()? onTap}) {
    Get.dialog(Builder(builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(0.0),
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        content: Container(
          width: MediaQuery.of(context).size.width - 40 > 400
              ? 500
              : MediaQuery.of(context).size.width - 40,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 80,
                decoration: const BoxDecoration(
                    color: Color(0xff515c6f),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Lottie.asset(
                      'assets/anim/info.json',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                title ?? 'Info!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.text1,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Text(
                  desc,
                  maxLines: 6,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColor.text1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    onPressed: onTap ??
                        () {
                          Navigator.pop(context);
                        },
                    color: const Color(0xffF19734),
                    height: 45,
                    minWidth: 150,
                    elevation: 6,
                    splashColor: AppColor.secondary,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Text(
                      "OK",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }), barrierDismissible: false);
  }

  static void infoTwoButtonDialog(title, desc, onTap1, onTap2, text1, text2) {
    Get.dialog(Builder(builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(0.0),
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        content: Container(
          width: MediaQuery.of(context).size.width - 40 > 400
              ? 500
              : MediaQuery.of(context).size.width - 40,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 80,
                decoration: const BoxDecoration(
                    color: Color(0xff515c6f),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Lottie.asset('assets/anim/info.json',
                        width: 150, height: 150, repeat: true),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.text1,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                desc,
                maxLines: 4,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColor.text1,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 8, bottom: 10),
                      child: MaterialButton(
                        onPressed: onTap1,
                        color: Colors.red,
                        height: 45,
                        minWidth: 150,
                        elevation: 6,
                        splashColor: AppColor.secondary,
                        textColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          text1,
                          //style: TStyleUtil.miniTitleText16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 16, bottom: 10),
                      child: MaterialButton(
                        onPressed: onTap2,
                        color: Colors.green,
                        height: 45,
                        minWidth: 150,
                        elevation: 6,
                        splashColor: AppColor.secondary,
                        textColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          text2,
                          //style: TStyleUtil.miniTitleText16,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }), barrierDismissible: false);
  }

  static void updateErrorDialog(description) {
    Get.dialog(Builder(builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(0.0),
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        content: Container(
          width: Get.width - 40 > 400 ? 500 : Get.width - 30,
          height: 240,
          //color: Colors.red,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                decoration: const BoxDecoration(
                    color: Color(0xff515c6f),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                width: Get.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Lottie.asset(
                      'assets/anim/error.json',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
              Text(
                'Oops...',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: AppColor.text1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  description,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColor.text1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (Platform.isAndroid || Platform.isIOS) {
                        // launchUrl(
                        //   url,
                        //   mode: LaunchMode.externalApplication,
                        // );
                        //Get.offAll(()=> const Login());
                      }
                    },
                    color: Colors.red,
                    height: 45,
                    minWidth: 150,
                    elevation: 6,
                    splashColor: AppColor.secondary,
                    textColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Text(
                      "Update Now",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }), barrierDismissible: false);
  }

  static void updateDialog(desc, cancelClick) {
    Get.dialog(Builder(builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(0.0),
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        content: Container(
          width: MediaQuery.of(context).size.width - 40 > 400
              ? 500
              : MediaQuery.of(context).size.width - 40,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 80,
                decoration: const BoxDecoration(
                    color: Color(0xff515c6f),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 13.0),
                    child: Lottie.asset('AppAsset.appUpdate',
                        height: 100, width: 100, repeat: true),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Update App!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.text1,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Text(
                  desc,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColor.text1,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: cancelClick,
                      color: Colors.red,
                      child: const Text(
                        'Later',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        if (Platform.isAndroid || Platform.isIOS) {
                          // launchUrl(
                          //   url,
                          //   mode: LaunchMode.externalApplication,
                          // );
                          //Get.offAll(()=> const Login());
                        }
                      },
                      color: const Color(0xff02895c),
                      child: const Text(
                        'Update Now',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      );
    }), barrierDismissible: false);
  }

  // static Future<void> deleteAccount() async {
  //   MyProfileController.currentPassController.clear();
  //   MyProfileController.currentObscure.value = true;
  //   var msg =  await SQLite.getValue(
  //       "ConfigValue", "AppConfig", "ConfigID =407");
  //   Get.dialog(Builder(builder: (context) {
  //     return AlertDialog(
  //       insetPadding: const EdgeInsets.all(0.0),
  //       titlePadding: const EdgeInsets.all(0.0),
  //       contentPadding: const EdgeInsets.all(0.0),
  //       backgroundColor: Colors.transparent,
  //       content: Container(
  //         width: MediaQuery.of(context).size.width - 40 > 400
  //             ? 500
  //             : MediaQuery.of(context).size.width - 40,
  //         decoration: const BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.all(Radius.circular(20))),
  //         child: Obx(() => Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Container(
  //               height: 80,
  //               decoration: const BoxDecoration(
  //                   color: Color(0xff282e37),
  //                   borderRadius: BorderRadius.only(
  //                       topRight: Radius.circular(20),
  //                       topLeft: Radius.circular(20))),
  //               width: MediaQuery.of(context).size.width,
  //               child: Center(
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(0.0),
  //                   child: Lottie.asset('assets/anim/warning_red.json',
  //                       width: 150, height: 150, repeat: true),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             Text(
  //               'Account Deletion Request!',
  //               style: TextStyle(
  //                   fontSize: 18,
  //                   color: CColor.text1,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             Text(
  //               MyProfileController.showPass.value ? 'Please Enter Your Password to Request Delete your Account' :
  //               msg,
  //               maxLines: 4,
  //               textAlign: TextAlign.center,
  //               overflow: TextOverflow.ellipsis,
  //               style: TextStyle(
  //                   fontSize: 16,
  //                   color: CColor.text1,
  //                   fontWeight: FontWeight.normal),
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             if(MyProfileController.showPass.value)...[
  //               Container(
  //                 height: 60,
  //                 padding: const EdgeInsets.symmetric(
  //                     horizontal: 8.0, vertical: 4),
  //                 child: TextFormField(
  //                   controller: MyProfileController.currentPassController,
  //                   focusNode: MyProfileController.currentNode,
  //                   autocorrect: false,
  //                   showCursor: true,
  //                   cursorColor: CColor.secondary,
  //                   textInputAction: TextInputAction.done,
  //                   keyboardType: TextInputType.visiblePassword,
  //                   obscureText: MyProfileController.currentObscure.value,
  //                   obscuringCharacter: '●',
  //                   decoration: InputDecoration(
  //                     contentPadding: const EdgeInsets.all(4.0),
  //                     labelText: 'Password',
  //                     labelStyle: TextStyle(color: CColor.text1),
  //                     enabledBorder: UnderlineInputBorder(
  //                       borderSide: const BorderSide(
  //                         width: 2,
  //                         color: Colors.grey,
  //                       ),
  //                       //gapPadding: 10,
  //                       borderRadius: BorderRadius.circular(6),
  //                     ),
  //                     focusedBorder: UnderlineInputBorder(
  //                       borderSide: BorderSide(
  //                         width: 2,
  //                         color: CColor.primary,
  //                       ),
  //                       borderRadius: BorderRadius.circular(6),
  //                     ),
  //                     suffixIcon: Padding(
  //                       padding: const EdgeInsets.only(right: 0.0, left: 0.0),
  //                       child: IconButton(
  //                         icon: Icon(
  //                           MyProfileController.currentObscure.value
  //                               ? CupertinoIcons.eye
  //                               : CupertinoIcons.eye_slash,
  //                           size: 26,
  //                         ),
  //                         onPressed: () {
  //                           MyProfileController.currentObscure.value =
  //                           !MyProfileController.currentObscure.value;
  //                         },
  //                       ),
  //                     ),
  //                   ),
  //                   autovalidateMode: AutovalidateMode.disabled,
  //                   onFieldSubmitted: (c) {
  //                     Functions.closeKeyboard();
  //                   },
  //                 ),
  //               ),
  //             ],
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: Padding(
  //                     padding:
  //                     const EdgeInsets.only(left: 16, right: 8, bottom: 10),
  //                     child: MaterialButton(
  //                       onPressed: (){
  //                         Get.back();
  //                       },
  //                       color: Colors.green,
  //                       height: 45,
  //                       minWidth: 150,
  //                       elevation: 6,
  //                       splashColor: Colors.green.shade400,
  //                       textColor: Colors.white,
  //                       shape: const RoundedRectangleBorder(
  //                           borderRadius:
  //                           BorderRadius.all(Radius.circular(30))),
  //                       child: Text(
  //                         MyProfileController.showPass.value ? 'Cancel' :
  //                         'No, Keep it.',
  //                         style: TStyleUtil.miniTitleText16,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Expanded(
  //                   child: Padding(
  //                     padding:
  //                     const EdgeInsets.only(left: 8, right: 16, bottom: 10),
  //                     child: MaterialButton(
  //                       onPressed: (){
  //                         if(MyProfileController.showPass.value)
  //                           {
  //                             //Get.back();
  //                             MyProfileController.deleteAccount();
  //                           }
  //                         else
  //                           {
  //                             MyProfileController.showPass.value = true;
  //                           }
  //
  //                         //
  //                         //
  //                       },
  //                       color: Colors.red,
  //                       height: 45,
  //                       minWidth: 150,
  //                       elevation: 6,
  //                       splashColor: Colors.red.shade300,
  //                       textColor: Colors.white,
  //                       shape: const RoundedRectangleBorder(
  //                           borderRadius:
  //                           BorderRadius.all(Radius.circular(30))),
  //                       child: Text(
  //                         MyProfileController.showPass.value ? 'Submit' :
  //                         'Yes, Delete it.',
  //                         style: TStyleUtil.miniTitleText16,
  //                       ),
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             )
  //           ],
  //         )),
  //       ),
  //     );
  //   }), barrierDismissible: false);
  // }

  static Future<void> confirmDelete(msg, {deleteClick, cancelClick}) async {
    Get.dialog(Builder(builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(0.0),
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        content: Container(
          width: MediaQuery.of(context).size.width - 40 > 400
              ? 500
              : MediaQuery.of(context).size.width - 40,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 80,
                decoration: const BoxDecoration(
                    color: Color(0xff282e37),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Lottie.asset('assets/anim/warning_red.json',
                        width: 150, height: 150, repeat: true),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Account Deletion Request!',
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.text1,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  msg,
                  maxLines: 10,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColor.text1,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 16, bottom: 10),
                      child: MaterialButton(
                        onPressed: deleteClick,
                        color: Colors.red,
                        height: 45,
                        minWidth: 150,
                        elevation: 6,
                        splashColor: Colors.red.shade300,
                        textColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          'Yes, Delete it.',
                          //style: TStyleUtil.miniTitleText16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 8, bottom: 10),
                      child: MaterialButton(
                        onPressed: cancelClick,
                        color: Colors.green,
                        height: 45,
                        minWidth: 150,
                        elevation: 6,
                        splashColor: Colors.green.shade400,
                        textColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          'No, Keep it.',
                          // style: TStyleUtil.miniTitleText16,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }), barrierDismissible: false);
  }
}
