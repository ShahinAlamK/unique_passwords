import 'package:flutter/material.dart';

class SizeConfig{

  static MediaQueryData ? _queryData;
  static double ? height;
  static double ? width;
  void init(BuildContext context){
    _queryData = MediaQuery.of(context);
    height = _queryData!.size.height;
    width = _queryData!.size.width;
  }
}

double getHeight(double height){
  double _height = SizeConfig.height!;
  return (height / 800)*_height;
}

double getWidth(double width){
  double _width = SizeConfig.width!;
  return (width / 360)*_width;
}