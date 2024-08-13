import 'package:flutter/material.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:ukk_rpl_2024/controller/authController.dart';
import 'package:ukk_rpl_2024/controller/topikController.dart';
import 'package:ukk_rpl_2024/model/authModel.dart';
import 'package:ukk_rpl_2024/model/topikModel.dart';
import 'package:ukk_rpl_2024/view/loginProdiView.dart';
import 'package:ukk_rpl_2024/view/loginView.dart';
import 'package:ukk_rpl_2024/view/registerView.dart';
import 'package:ukk_rpl_2024/view/topik/create.dart';
import 'package:ukk_rpl_2024/view/topik/edit.dart';
import 'package:ukk_rpl_2024/view/topik/index.dart';

void main() async {
  final conn = await MySQLConnection.createConnection(
      host: "10.0.2.2",
      port: 3306,
      userName: 'root', // use your own
      password: '', // use your own
      databaseName: "db_flutter_mysql", // use your own
      secure: false);

  await conn.connect();

  final modelAuth = AuthModel(conn);
  final controllerAuth = AuthController(modelAuth);

  final modelTopik = TopikModel(conn);
  final controllerTopik = TopikController(modelTopik);

  MyApp app = MyApp(
    controller: controllerAuth,
    controllerTopik: controllerTopik,
  );
  runApp(app);
}

class MyApp extends StatelessWidget {
  final AuthController controller;
  final TopikController controllerTopik;

  const MyApp(
      {super.key, required this.controller, required this.controllerTopik});

  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/login': (context) => LoginView(controller: controller),
        '/login-prodi': (context) => LoginProdiView(controller: controller),
        '/registrasi': (context) => RegisterView(controller: controller),
        '/topik-create': (context) =>
            TopikCreateView(controller: controllerTopik),
        '/topik-edit': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return TopikEditView(
            controller: controllerTopik,
            idTopik: args['idTopik'],
          );
        },
        '/topik': (context) => TopikView(controller: controllerTopik),
      },
      initialRoute: '/login',
    );
    return materialApp;
  }
}