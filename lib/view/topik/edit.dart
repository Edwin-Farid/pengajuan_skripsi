import 'package:flutter/material.dart';
import 'package:ukk_rpl_2024/controller/topikController.dart';

class TopikEditView extends StatefulWidget {
  final TopikController controller;
  final String idTopik;

  const TopikEditView(
      {super.key, required this.controller, required this.idTopik});

  @override
  State<TopikEditView> createState() => TopikEditViewState();
}

class TopikEditViewState extends State<TopikEditView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nimController;
  late TextEditingController _dospenUtamaController;
  late TextEditingController _topik1Controller;
  late TextEditingController _topik2Controller;
  late TextEditingController _topik3Controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _nimController = TextEditingController();
    _dospenUtamaController = TextEditingController();
    _topik1Controller = TextEditingController();
    _topik2Controller = TextEditingController();
    _topik3Controller = TextEditingController();
    _loadMahasiswaData();
  }

  void _loadMahasiswaData() async {
    final topik = await widget.controller.getTopik(widget.idTopik);
    if (topik != null) {
      _nimController = TextEditingController(text: topik['nim']);
      _dospenUtamaController = TextEditingController(text: topik['dospem']);
      _topik1Controller = TextEditingController(text: topik['topik1']);
      _topik2Controller = TextEditingController(text: topik['topik2']);
      _topik3Controller = TextEditingController(text: topik['topik3']);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data Mahasiswa Tidak terbaca!"),
        ),
      );
      Navigator.pop(context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _nimController.dispose();
    _dospenUtamaController.dispose();
    _topik1Controller.dispose();
    _topik2Controller.dispose();
    _topik3Controller.dispose();
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
            "Edit Topik Skripsi",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/topik');
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 94, 163, 220),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _nimController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "NIM",
                  labelStyle: TextStyle(color: Colors.black87),
                  filled: true,
                  fillColor: Color.fromARGB(111, 154, 154, 154),
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
                controller: _dospenUtamaController,
                decoration: const InputDecoration(
                  labelText: "Dosen Pembimbing Utama",
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
                controller: _topik1Controller,
                decoration: const InputDecoration(
                  labelText: "Topik 1",
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
                controller: _topik2Controller,
                decoration: const InputDecoration(
                  labelText: "Topik 2",
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
                controller: _topik3Controller,
                decoration: const InputDecoration(
                  labelText: "Topik 3",
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String nim = _nimController.text;
                    String dospem = _dospenUtamaController.text;
                    String topik1 = _topik1Controller.text;
                    String topik2 = _topik2Controller.text;
                    String topik3 = _topik3Controller.text;
                    widget.controller.edit(context, widget.idTopik, nim, dospem,
                        topik1, topik2, topik3);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 94, 163, 220),
                  ),
                  child: const Text(
                    "Perbaharui",
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
