import 'package:flutter/material.dart';
import 'package:ukk_rpl_2024/controller/authController.dart';

class RegisterView extends StatefulWidget {
  final AuthController controller;
  const RegisterView({super.key, required this.controller});

  @override
  State<RegisterView> createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  final _nimController = TextEditingController();
  final _namaController = TextEditingController();
  final _prodiController = TextEditingController();
  final _tahunmasukController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nimController.dispose();
    _namaController.dispose();
    _prodiController.dispose();
    _tahunmasukController.dispose();
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
            "Registrasi",
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 94, 163, 220),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _nimController,
                decoration: const InputDecoration(
                  labelText: "NIM",
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
                keyboardType: TextInputType.text,
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: "Nama",
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
                keyboardType: TextInputType.text,
                controller: _prodiController,
                decoration: const InputDecoration(
                  labelText: "Program Studi",
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
                keyboardType: TextInputType.text,
                controller: _tahunmasukController,
                decoration: const InputDecoration(
                  labelText: "Tahun Masuk",
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
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: InkWell(
                  child: const Text("Sudah punya akun? Login disini!"),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String nim = _nimController.text;
                    String namaMahasiswa = _namaController.text;
                    String programStudi = _prodiController.text;
                    String tahunMasuk = _tahunmasukController.text;
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    widget.controller.register(context, nim, namaMahasiswa,
                        programStudi, tahunMasuk, username, password);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 94, 163, 220),
                  ),
                  child: const Text(
                    "Registrasi",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
