import 'package:flutter/material.dart';
import 'package:inventory_management/views/home_page.dart';
import 'package:inventory_management/views/login_page.dart';
import 'package:inventory_management/views/signup_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://xuxgellbbmchhsgwdlkw.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh1eGdlbGxiYm1jaGhzZ3dkbGt3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzgwNDQyNDMsImV4cCI6MjA1MzYyMDI0M30.mb0osfmruQD0OyhB_kb-5L91H_ryBFouI5mshnRnlgY",
  );

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
        '/home': (context) => const HomePage(),
      },
    );
  }
}
