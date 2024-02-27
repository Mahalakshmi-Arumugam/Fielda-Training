import 'package:fielda_project/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fielda_project/profile_page.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  bool isEmailValid = false;

  void validateEmail(String email) {
    bool isValid = RegExp(r'^.+@.+$').hasMatch(email);

    setState(() {
      isEmailValid = isValid || email.isEmpty;
    });
  }

  void dismissKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dismissKeyboard,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo2.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(140.0, 80.0, 140.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Reset password',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Enter your email address and we will send you a code to reset\nyour password.',
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 3),
                          child: SizedBox(
                            width: 350.0,
                            child: TextField(
                              focusNode: _emailFocusNode,
                              controller: _emailController,
                              onChanged: (email) {
                                validateEmail(email);
                                if (email.isEmpty) {
                                  setState(() {
                                    isEmailValid = false;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Email',
                                suffixIcon: _emailController.text.isNotEmpty
                                    ? (isEmailValid
                                        ? const Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          )
                                        : const Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ))
                                    : null,
                              ),
                            ),
                          ),
                        ),
                        if (!isEmailValid && _emailController.text.isNotEmpty)
                          const Padding(
                            padding: EdgeInsets.only(right: 40.0, top: 8.0),
                            child: Text(
                              'Please enter a valid email address.',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(148, 184, 181, 181),
                        backgroundColor:
                            isEmailValid ? Colors.blue : const Color.fromARGB(148, 184, 181, 181),
                        side: const BorderSide(
                          color: Color.fromARGB(148, 184, 181, 181),
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(150.0, 45.0),
                      ),
                      child: const Text(
                        'Send reset email',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Back to',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                          );
                        },
                        child: const Text(
                          ' Sign in',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
