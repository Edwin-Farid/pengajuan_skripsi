import 'package:mysql_client/mysql_client.dart';

class TopikModel {
  final MySQLConnection conn;

  TopikModel(this.conn);

  Future<void> createTopik(
    String nim,
    String dospem,
    String topik1,
    String topik2,
    String topik3,
  ) async {
    await conn.execute(
      "INSERT INTO pengajuan_topik (nim, dosen_pembimbing_utama, topik_1, topik_2, topik_3) VALUE (:nim, :dospem, :topik1, :topik2, :topik3)",
      {
        "nim": nim,
        "dospem": dospem,
        "topik1": topik1,
        "topik2": topik2,
        "topik3": topik3,
      },
    );
  }

  Future<List<Map<String, String>>> getAllTopik() async {
    var result = await conn.execute('SELECT * FROM pengajuan_topik');

    List<Map<String, String>> topikList = [];

    for (final row in result.rows) {
      topikList.add({
        'id_topik': row.colAt(0) ?? '',
        'nim': row.colAt(1) ?? '',
        'dospem': row.colAt(2) ?? '',
        'topik1': row.colAt(3) ?? '',
        'topik2': row.colAt(4) ?? '',
        'topik3': row.colAt(5) ?? '',
      });
    }

    return topikList;
  }

  Future<Map<String, String>?> getTopikByIdTopik(String idTopik) async {
    var result = await conn.execute(
      "SELECT * FROM pengajuan_topik WHERE id_topik = :idTopik",
      {"idTopik": idTopik},
    );

    if (result.rows.isNotEmpty) {
      final row = result.rows.first;
      return {
        'id_topik': row.colAt(0) ?? '',
        'nim': row.colAt(1) ?? '',
        'dospem': row.colAt(2) ?? '',
        'topik1': row.colAt(3) ?? '',
        'topik2': row.colAt(4) ?? '',
        'topik3': row.colAt(5) ?? '',
      };
    }

    return null;
  }

  Future<void> updateTopik(
    String idTopik,
    String nim,
    String dospem,
    String topik1,
    String topik2,
    String topik3,
  ) async {
    await conn.execute(
      "UPDATE pengajuan_topik SET nim = :nim, dosen_pembimbing_utama = :dospem, topik_1 = :topik1, topik_2 = :topik2, topik_3 = :topik3 WHERE id_topik = :idTopik",
      {
        "idTopik": idTopik,
        "nim": nim,
        "dospem": dospem,
        "topik1": topik1,
        "topik2": topik2,
        "topik3": topik3,
      },
    );
  }

  Future<void> deleteTopik(String idTopik) async {
    await conn.execute(
      'DELETE FROM pengajuan_topik WHERE id_topik = :idTopik',
      {"idTopik": idTopik},
    );
  }
}
