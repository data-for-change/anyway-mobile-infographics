import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/service_locator.dart';
import 'ui/views/news_flash_page.dart';

void main() {
  setupServiceLocator();
  runApp(AnywayApp());
}

class AnywayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ANYWAY',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.alefTextTheme(Theme.of(context).textTheme)),
      home: Directionality(
          textDirection: TextDirection.rtl, child: NewsFlashesScreen()),
    );
  }
}
