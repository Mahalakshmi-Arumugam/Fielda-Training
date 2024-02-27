import 'package:flutter/material.dart';
import 'package:fielda_project/profile_page.dart';
import 'reset_password.dart'; 

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isPasswordVisible = false;
  bool hasTriedToSignIn = false;

  void validateEmail(String email) {
    bool isValid = RegExp(r'^.+@.+$').hasMatch(email);

    setState(() {
      isEmailValid = isValid || email.isEmpty;
    });
  }

  void validatePassword(String password) {
    bool isValid = password.isNotEmpty &&
        password.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

    setState(() {
      isPasswordValid = isValid || password.isEmpty;
    });
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
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
              right: 0,
              bottom: 0,
              child: Container(
                width: 200,
                height: 40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/fill3.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
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
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(140.0, 40.0, 140.0, 0.0),
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
                      'Welcome',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Sign In to explore Fielda',
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
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
                              onChanged: validateEmail,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 3),
                          child: SizedBox(
                            width: 350.0,
                            child: TextField(
                              focusNode: _passwordFocusNode,
                              controller: _passwordController,
                              obscureText: !isPasswordVisible,
                              onChanged: validatePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                errorText: (hasTriedToSignIn &&
                                        !isPasswordValid)
                                    ? 'Password must be at least 8 characters'
                                    : null,
                                suffix: GestureDetector(
                                  onTap: togglePasswordVisibility,
                                  child: Text(
                                    isPasswordVisible ? 'Hide' : 'Show',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (!isPasswordValid &&
                            _passwordController.text.isNotEmpty)
                          const Padding(
                            padding: EdgeInsets.only(right: 40.0, top: 8.0),
                            child: Text(
                              'Please enter a valid password.',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        const SizedBox(height: 40.0),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          hasTriedToSignIn = true;
                        });

                        if (isEmailValid &&
                            _passwordController.text.length >= 8) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(148, 184, 181, 181),
                        backgroundColor: (isEmailValid &&
                                _passwordController.text.length >= 8)
                            ? Colors.blue
                            : const Color.fromARGB(148, 184, 181, 181),
                        disabledBackgroundColor:
                            const Color.fromARGB(148, 184, 181, 181), 
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
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const SizedBox(height: 30.0),
                  Container(
                    width: double.infinity,
                    height: 40,
                   color: Color(0xFF95E5D8),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 80.0),
                          child: Text(
                            'New to Fielda?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 120.0),
                        child: Text(
                          'About Fielda',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          'v2.45',
                          style: TextStyle(
                            color: Color.fromRGBO(158, 158, 158, 0.778),
                            fontSize: 13.0,
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
