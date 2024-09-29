import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

const TextStyle defaultTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: "Pretendard",
  fontSize: 22,
  fontWeight: FontWeight.bold,
);
OutlineInputBorder studentButtonStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(24.0),
    borderSide: const BorderSide(color: STUDENT_BUTTON_COLOR));

OutlineInputBorder generalButtonStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(24.0),
    borderSide: const BorderSide(color: PRIMARY_COLOR));
