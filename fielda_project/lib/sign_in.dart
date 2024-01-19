import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    transform: Matrix4.translationValues(
                      0.0,
                      -(_emailFocusNode.hasFocus ? 30.0 : 12.0),
                      0.0,
                    ),
                    child: SizedBox(
                      width: 350.0,
                      child: TextField(
                        focusNode: _emailFocusNode,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
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
                    duration: const Duration(milliseconds: 300),
                    transform: Matrix4.translationValues(
                      0.0,
                      -(_passwordFocusNode.hasFocus ? 30.0 : 12.0),
                      0.0,
                    ),
                    child: SizedBox(
                      width: 350.0,
                      child: TextField(
                        focusNode: _passwordFocusNode,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 222, 220, 220),
                  backgroundColor: const Color.fromARGB(255, 198, 195, 195),
                  side: const BorderSide(
                      color: Color.fromARGB(255, 184, 181, 181), width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(300.0, 45.0),
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
            const Padding(
              padding: EdgeInsets.only(left: 115.0),
              child: Text(
                'Forgot your password?',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              width: double.infinity,
              height: 40,
              color: const Color.fromARGB(211, 86, 233, 218),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 80.0),
                    child: Text(
                      'New to Fielda?',
                      style: TextStyle(
                        color: Colors.grey,
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
    );
  }
}
