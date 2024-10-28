import 'package:flutter/material.dart';
// Import halaman-halaman yang dibutuhkan
import 'package:myflutter/pages/splash_screen.dart';
import 'pages/login_page.dart';
import 'pages/registration_page.dart';
import 'pages/forgot_password.dart';
import 'pages/home_page.dart';
import 'pages/account_page.dart';
import 'pages/profile_page.dart';
import 'pages/notifications_page.dart'; // Import halaman notifikasi baru
import 'pages/verification_page.dart'; // Import halaman verifikasi kode baru

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/registration': (context) => RegistrationPage(),
        '/forgot_password': (context) => ForgotPasswordPage(),
        '/home': (context) => HomePage(),
        '/account': (context) => AccountPage(),
        '/profile': (context) => ProfilePage(),
        '/notifications': (context) => NotificationsPage(), // Halaman notifikasi
        '/verification': (context) => VerificationPage(), // Halaman verifikasi kode
      },
    );
  }
}
