import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerifyEmailPage extends StatefulWidget {
  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  bool _isLoading = false;
  String? _message;


  Future<void> _verifyCode() async {
    final code = _codeController.text;
    final url = Uri.parse('http://127.0.0.1:8000/authentication/verify/'); // Updated URL

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'verification_code': code,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          _message = 'Email verified successfully';
        });
      } else {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          _message = responseData['error'];
        });
      }
    } catch (error) {
      setState(() {
        _message = 'An error occurred. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(labelText: 'Verification Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the verification code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              if (_isLoading) CircularProgressIndicator(),
              if (_message != null) ...[
                SizedBox(height: 20),
                Text(
                  _message!,
                  style: TextStyle(
                    color: _message == 'Email verified successfully'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ],
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _verifyCode,
                child: Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}