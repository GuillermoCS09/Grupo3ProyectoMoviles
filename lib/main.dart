import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_sm/view/misPredicciones_view.dart';
import 'package:proyecto_sm/viewmodel/misPredicciones_view_model.dart';
import 'splash.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Proyecto Grupo 3 - Taller de Desarrollo Movil

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
    await Firebase.initializeApp(options: FirebaseOptions(
        apiKey: "AIzaSyAEm4uf9qNvhPCwWtQBMYg4P92dQtCBFQM",
        appId: "1:69399701749:web:9272fa1d3ea326605b3dbc",
        messagingSenderId: "69399701749",
        projectId: "flutter-reservatech")
    );
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Proyecto Grupo 3',
      theme: ThemeData(unselectedWidgetColor: Colors.grey[200],),
      home: MyAppSplash(),
    );
  }
}