import 'dart:math';

import 'package:flutter/material.dart';

Color randomOpaqueColor() {
  return Color(Random().nextInt(0xffff9999)).withAlpha(0xff);
}

int randomNumber({required int min, required int max}) {
  return min + Random().nextInt(max - min);
}

String timeStampToFilename() {
  final now = DateTime.now();

  final y = now.year.toString().padLeft(4, '0');
  final m = now.month.toString().padLeft(2, '0');
  final d = now.day.toString().padLeft(2, '0');
  final h = now.hour.toString().padLeft(2, '0');
  final mi = now.minute.toString().padLeft(2, '0');
  final s = now.second.toString().padLeft(2, '0');

  final filename = y + m + d + h + mi + s;

  return filename;
}
