import 'package:flutter/material.dart';
import 'package:inventory_management/views/home_page.dart';
import 'package:inventory_management/views/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AuthState>(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            final authState = snapshot.data!;
            if (authState.event == AuthChangeEvent.signedIn) {
              return const HomePage();
            }
          }

          return const LoginPage();
        },
      ),
    );
  }
}
