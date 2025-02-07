import 'package:flutter/material.dart';
import 'package:inventory_management/views/login_page.dart';
import 'package:inventory_management/views/otp_verification_page.dart';
import 'package:inventory_management/views/signup_page.dart';
import 'package:inventory_management/widgets/bottom_nav.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: "https://xuxgellbbmchhsgwdlkw.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh1eGdlbGxiYm1jaGhzZ3dkbGt3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg5MTM3ODMsImV4cCI6MjA1NDQ4OTc4M30.8SDGg3MDdoZw38oRlrrRUrt5Z1x2BXbT8KDM5APGhzQ");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory Management',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => BottomNavBarScreen(),
        "/verify-otp": (context) => const OTPVerificationPage(phoneNumber: ""),
      },
    );
  }
}
