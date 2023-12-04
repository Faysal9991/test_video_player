import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';

Widget fadeUpAnimation({required Widget child}){
  return FadeInUp(duration: const Duration(milliseconds: 1500), child: child);
}

Widget fadeDownAnimation({required Widget child}){
  return FadeInDown(duration: const Duration(milliseconds: 1500), child: child);
}