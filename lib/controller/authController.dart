import 'package:flutter/material.dart';
import 'package:ukk_rpl_2024/model/authModel.dart';

class AuthController {
  final AuthModel model;

  AuthController(this.model);

  Future<void> login(
      BuildContext context, String username, String password) async {
    bool isAuthenticated = await model.logins(username, password);

    if (isAuthenticated) {
      Navigator.pushNamed(context, '/topik-create');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login berhasil! \nHallo $username"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Gagal, username atau password anda salah!"),
        ),
      );
    }
  }

  Future<void> loginProdi(
      BuildContext context, String username, String password) async {
    bool isAuthenticated = await model.loginP(username, password);

    if (isAuthenticated) {
      Navigator.pushReplacementNamed(context, '/topik');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login berhasil! \nHallo $username"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Gagal, username atau password anda salah!"),
        ),
      );
    }
  }

  Future<void> register(
      BuildContext context,
      String nim,
      String namaMahasiswa,
      String programStudi,
      String tahunMasuk,
      String username,
      String password) async {
    try {
      await model.registers(
          nim, namaMahasiswa, programStudi, tahunMasuk, username, password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Berhasil registrasi di simpan!"),
        ),
      );
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error: e"),
        ),
      );
    }
  }
}
