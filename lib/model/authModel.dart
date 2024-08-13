import 'package:mysql_client/mysql_client.dart';

class AuthModel {
  final MySQLConnection conn;

  AuthModel(this.conn);

  Future<bool> logins(String username, String password) async {
    var result = await conn.execute(
      "SELECT * FROM mahasiswa WHERE username = :username AND password = :password",
      {"username": username, "password": password},
    );

    return result.rows.isNotEmpty;
  }

  Future<bool> loginP(String username, String password) async {
    var result = await conn.execute(
      "SELECT * FROM program_studi WHERE username = :username AND password = :password",
      {"username": username, "password": password},
    );

    return result.rows.isNotEmpty;
  }

  Future<void> registers(String nim, String namaMahasiswa, String programStudi,
      String tahunMasuk, String username, String password) async {
    await conn.execute(
      "INSERT INTO mahasiswa (nim, nama_mahasiswa, program_studi,tahun_masuk,username, password) VALUE (:nim, :namaMahasiswa, :programStudi, :tahunMasuk, :username, :password)",
      {
        "nim": nim,
        "namaMahasiswa": namaMahasiswa,
        "programStudi": programStudi,
        "tahunMasuk": tahunMasuk,
        "username": username,
        "password": password,
      },
    );
  }
}
