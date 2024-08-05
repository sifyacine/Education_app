import 'package:education_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EnterCodePage extends StatefulWidget {
  final String email;

  EnterCodePage({required this.email});

  @override
  _EnterCodePageState createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  final TextEditingController _codeController = TextEditingController();

  Future<void> _verifyCode() async {
    final code = _codeController.text;
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/authentication/verify_reset_code/'),
      body: {'email': widget.email, 'code': code},
    );
    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPasswordPage(email: widget.email)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseData['error'] ?? 'Invalid code')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Code')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              decoration: InputDecoration(labelText: 'Code'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyCode,
              child: Text('Verify Code'),
            ),
          ],
        ),
      ),
    );
  }
}
