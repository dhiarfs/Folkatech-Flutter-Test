part of 'screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashTimer(context);
  }

  //Membuat Splash Screen dengan durasi 2 Detik setelah itu layar akan diganti dengan MainPage()
  splashTimer(BuildContext context) async {
    return Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maroonColor,
      body: Center(
        child: Text(
          "Folka Food",
          style: extraWhiteFont.copyWith(fontSize: 32),
        ),
      ),
    );
  }
}
