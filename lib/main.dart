import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:science/providers/subject_provider.dart';
import 'package:science/screens/home_page.dart';
import 'package:science/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SubjectProvider())],
      child: MaterialApp(
        title: 'Science - Class Ten',
        theme: ThemeData(
          primarySwatch: kPrimaryColor,
          fontFamily: GoogleFonts.poppins().fontFamily,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            centerTitle: true,
            titleTextStyle: kAppbarTitleTextStyle.copyWith(color: Colors.black),
            iconTheme: const IconThemeData(color: Colors.black)
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
