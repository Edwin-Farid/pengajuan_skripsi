import 'package:flutter/material.dart';
import 'package:ukk_rpl_2024/model/topikModel.dart';

class TopikController {
  final TopikModel model;

  TopikController(this.model);

  Future<void> create(
    BuildContext context,
    String nim,
    String dospem,
    String topik1,
    String topik2,
    String topik3,
  ) async {
    try {
      await model.createTopik(nim, dospem, topik1, topik2, topik3);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Berhasil mengajukan topik!"),
        ),
      );
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "Error: Anda sudah mengajukan! atau Pastikan NIM anda benar!"),
        ),
      );
    }
  }

  Future<List<Map<String, String>>> fetchAllTopik() async {
    return await model.getAllTopik();
  }

  Future<Map<String, String>?> getTopik(String idTopik) async {
    return await model.getTopikByIdTopik(idTopik);
  }

  Future<void> edit(BuildContext context, String idTopik, String nim,
      String dospem, String topik1, String topik2, String topik3) async {
    try {
      await model.updateTopik(idTopik, nim, dospem, topik1, topik2, topik3);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Topik Berhasil di perbarui"),
        ),
      );
      Navigator.pushReplacementNamed(context, '/topik');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error: e"),
        ),
      );
    }
  }

  Future<void> deleteTopik(String idTopik) async {
    await model.deleteTopik(idTopik);
  }
}
