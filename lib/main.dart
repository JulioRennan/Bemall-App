import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/providers/local_storage.dart';

void main() async {
  await LocalStorage.initStorage();
  runApp(App());
}
