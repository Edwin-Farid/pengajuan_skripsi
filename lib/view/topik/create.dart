import 'package:flutter/material.dart';
import 'package:ukk_rpl_2024/controller/topikController.dart';

class TopikCreateView extends StatefulWidget {
  final TopikController controller;
  const TopikCreateView({super.key, required this.controller});

  @override
  State<TopikCreateView> createState() => _TopikCreateViewState();
}

class _TopikCreateViewState extends State<TopikCreateView> {
  final _nimController = TextEditingController();
  final _dospenUtamaController = TextEditingController();
  final _topik1Controller = TextEditingController();
  final _topik2Controller = TextEditingController();
  final _topik3Controller = TextEditingController();

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
            "Tulis Topik Skripsi",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
                    widget.controller
                        .create(context, nim, dospem, topik1, topik2, topik3);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 94, 163, 220),
                  ),
                  child: const Text(
                    "Ajukan",
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
