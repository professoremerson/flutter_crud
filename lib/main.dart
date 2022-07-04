import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_crud/screens/home_screen_products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initializeApp = Firebase.initializeApp(
        options: FirebaseOptions(
            /**
           * ALTERAR PARA AS INFORMAÇÕES DO PROJETO DE VOCÊS DENTRO DO 
           * FIREBASE
           */
            // consta no arquivo json
            apiKey: "AIzaSyAOaOD4IEVcRvR6KWgNsVehNfpExKuw0Fg",
            // id do aplicativo
            appId: "1:203216371076:android:40298a8299fe50367971d1",
            // id do remetente
            messagingSenderId: "203216371076",
            // código do projeto
            projectId: "fluttercrud-17a5e"));
    // initializando a conexão com o firebase/firestore
    return FutureBuilder(
      future: _initializeApp,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            "Ocorreu um erro ao inicializar o Firebase! ${snapshot.error}",
            textDirection: TextDirection.ltr,
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.indigo,
              brightness: Brightness.dark,
            ),
            home: HomeScreenProducts(),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
