import 'package:flutter/material.dart';
import 'package:safir_challenge/utils.dart';

class AppTxtStyle{
  static getAppMainTxtStyle(
      {required double size, required FontWeight fontWeight}) {
    return TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: Colors.black,
      fontFamily: Utils.ChivoMonoFont,
    );
  }
  static getAppMainTxtStyleWhiteColor(
      {required double size, required FontWeight fontWeight}) {
    return TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: Colors.white,
      fontFamily: Utils.ChivoMonoFont,
    );
  }
  static getAppMainTxtStyleCustomColor(
      {required double size, required FontWeight fontWeight, required Color color}) {
    return TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
      fontFamily: Utils.ChivoMonoFont,
    );
  }
}