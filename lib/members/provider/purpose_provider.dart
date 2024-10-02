import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPurposeProvider = StateProvider<String>((ref) {
  return "";
});
final nameControllerProvider = Provider((ref) => TextEditingController());
final schoolControllerProvider = Provider((ref) => TextEditingController());
final gradeControllerProvider = Provider((ref) => TextEditingController());
