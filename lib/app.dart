import 'package:education_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/authentication/controllers/profile/user_controller.dart';
import 'features/authentication/screens/login/login_screen.dart';
import 'features/authentication/screens/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchUserData(String email) async {
  final url = Uri.parse('http://127.0.0.1:8000/authentication/user-profile/'); // Update with your endpoint
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({'channel_email': email}),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load user data');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  Future<String?> _getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final isLoggedIn = snapshot.data ?? false;
          if (isLoggedIn) {
            return FutureBuilder<String?>(
              future: _getUserEmail(),
              builder: (context, emailSnapshot) {
                if (emailSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final email = emailSnapshot.data;
                  if (email != null) {
                    final UserController userController = Get.put(UserController());
                    fetchUserData(email).then((userData) {
                      userController.setUserData(userData);
                    });
                  }
                  return GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    themeMode: ThemeMode.system,
                    theme: TAppTheme.lightTheme,
                    darkTheme: TAppTheme.lightTheme,
                    home: const HomeScreen(),
                  );
                }
              },
            );
          } else {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.system,
              theme: TAppTheme.lightTheme,
              darkTheme: TAppTheme.lightTheme,
              home: const LoginScreen(),
            );
          }
        }
      },
    );
  }
}
