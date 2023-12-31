import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await Supabase.initialize(
      url: 'https://ilqyvxxyndehjjwnpemb.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlscXl2eHh5bmRlaGpqd25wZW1iIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5OTk1NTQ5NiwiZXhwIjoyMDE1NTMxNDk2fQ.5G8wc5_bkN7FOZsZaHVWcBRQbZotok9zzX6rtjpShjs');
  await GetStorage.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: box.read('session') != null ? HomePage() : LoginPage(),
      ),
    );
  }
}
