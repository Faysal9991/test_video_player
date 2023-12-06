import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget likeShareComponent(BuildContext context,String imageLocation,String text){
  return   Container(
    decoration: BoxDecoration(color:Colors.white, border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          SvgPicture.asset(imageLocation,height: 24,width: 24,),
          Text(text,style: Theme.of(context).textTheme.displayMedium!.copyWith(color: const Color(0xff718096)),)
        ],
      ),
    ),);
}