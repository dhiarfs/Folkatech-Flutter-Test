import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:folkatech_test/providers/menu_provider.dart';
import 'package:folkatech_test/screens/screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme().copyWith(
            bodyText1: GoogleFonts.poppins(),
          ),
        ),
        home: Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
