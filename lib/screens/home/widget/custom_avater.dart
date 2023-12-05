import 'package:flutter/material.dart';

Widget avatar(String image){
  return Container(
    height: 40,
    width: 40,
    decoration:  BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(image),fit: BoxFit.cover),
        color: Colors.green),

  );
}