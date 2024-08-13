import 'package:flutter/material.dart';
import 'package:ukk_rpl_2024/controller/authController.dart';

class LoginProdiView extends StatefulWidget {
  final AuthController controller;
  const LoginProdiView({super.key, required this.controller});

  @override
  State<LoginProdiView> createState() => _LoginProdiViewState();
}

class _LoginProdiViewState extends State<LoginProdiView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: const Text(
            "Login Prodi",
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 94, 163, 220),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(color: Colors.black87),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 94, 163, 220),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: "password",
                labelStyle: TextStyle(color: Colors.black87),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 94, 163, 220),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: InkWell(
                child: const Text("Apakah anda mahasiswa? Login disini!"),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  widget.controller.loginProdi(context, username, password);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 94, 163, 220),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
