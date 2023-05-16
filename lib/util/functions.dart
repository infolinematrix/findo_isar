import 'dart:math';

import 'package:flutter/material.dart';

Color randomOpaqueColor() {
  return Color(Random().nextInt(0xffff9999)).withAlpha(0xff);
}

int randomNumber({required int min, required int max}) {
  return min + Random().nextInt(max - min);
}
