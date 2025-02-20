import 'package:capricon/utils/colors.dart';
import 'package:flutter/material.dart';

BoxShadow customBoxShadow(){
  return BoxShadow(
    color: kGrey,
    spreadRadius: 1,
    blurRadius: 10,
    offset: const Offset(0, 3)
  );
}
  