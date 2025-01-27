import 'package:app/shared/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // THESE CONTROLLERS ARE NOT PART OF THE TEST, BUT MANAGE THE TEXTS IN THE TEXTFORMFIELD
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passTextEditingController =
      TextEditingController();

  // INSTANTING/STARTING AUTHENTICATION (ACCESSES THE AUTH SERVICE CLASS)
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tests'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              // THE TEST LOCATES THIS WIDGET ACCOUNT OF THE "email" KEY
              key: const Key('email'),
              controller: emailTextEditingController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              // THE TEST LOCATES THIS WIDGET ACCOUNT OF THE "pass" KEY
              key: const Key('pass'),
              controller: passTextEditingController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    // THE TEST LOCATES THIS WIDGET ACCOUNT OF THE "register" KEY
                    key: const Key("register"),
                    onPressed: () {
                      // VARIABLE TO SAVE THE RETURN/RESULT OF THE RESULT FUNCTION
                      final result =
                          // CALLS THE AUTH FUNCTION
                          _auth.register(
                              // WE SEARCH THE TEXT FROM THE EMAIL TEXTFORMFIEL
                              emailTextEditingController.text,
                              // WE SEARCH THE TEXT FROM THE PASSWORD TEXTFORMFIEL
                              passTextEditingController.text);

                      // CHECK IF IT WORKED (IF RESULT == NULL, THERE IS NO PROBLEM IN REGISTRATION)
                      if (result == null) {
                      }
                      // IF NOT, FIND THE ERROR
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            // AND MENTION THE RESULT OF THE ERROR
                            result.toString().toUpperCase(),
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text('REGISTER'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
