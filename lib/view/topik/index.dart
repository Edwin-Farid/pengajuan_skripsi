import 'package:flutter/material.dart';
import 'package:ukk_rpl_2024/controller/topikController.dart';

class TopikView extends StatefulWidget {
  final TopikController controller;

  const TopikView({super.key, required this.controller});

  @override
  State<TopikView> createState() => _TopikViewState();
}

class _TopikViewState extends State<TopikView> {
  late Future<List<Map<String, String>>> _topikListFuture;

  @override
  void initState() {
    super.initState();
    _topikListFuture = widget.controller.fetchAllTopik();
  }

  void _refreshTopikList() {
    setState(() {
      _topikListFuture = widget.controller.fetchAllTopik();
    });
  }

  void _editTopik(String idTopik) {
    Navigator.pushNamed(
      context,
      '/topik-edit',
      arguments: {'idTopik': idTopik},
    );
  }

  void _deleteTopik(String idTopik) async {
    await widget.controller.deleteTopik(idTopik);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Data berhasil di hapus"),
      ),
    );
    _refreshTopikList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: const Text(
            "Daftar Topik Skripsi",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login-prodi');
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 94, 163, 220),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/topik-create');
              },
              icon: const Icon(Icons.add),
              color: Colors.white,
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: _topikListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Data tidak ada"),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final topik = snapshot.data![index];
                return Card(
                  color: const Color.fromARGB(255, 246, 246, 246),
                  elevation: 0,
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "NIM: ${topik['nim']}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Dosen Pembimbing Utama: ${topik['dospem']}",
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Topik 1: ${topik['topik1']}",
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _editTopik(topik['id_topik']!);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 94, 163, 220)),
                              child: const Text(
                                "Edit",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _deleteTopik(topik['id_topik']!);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 236, 82, 71)),
                              child: const Text(
                                "Hapus",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
