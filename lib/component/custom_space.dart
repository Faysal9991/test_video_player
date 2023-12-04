import 'package:flutter/material.dart';

Widget gap({double? hight,double? width}){
  return SizedBox(
    height: hight ?? 0,
    width: width??0,
  );
}