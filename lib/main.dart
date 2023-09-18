import 'package:flutter/material.dart';
import 'barra_inferior.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Proyecto ',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(body: MyHomeLoginApp())
    );
  }
}

class MyHomeLoginApp extends StatefulWidget {
  @override
  State<MyHomeLoginApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeLoginApp> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50), // Margen horizontal con respecto a los bordes de la pantalla
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Image.asset(
              'images/Logo_SM.png',
              width: 280,
              height: 280,
            ),
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Correo Institucional',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Ingrese su correo institucional';
                }
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Ingrese su contraseña';
                }
              },
            ),
            //BOTON
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 120),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    runApp(MyApp()); //Aca llama a la pestaña inicio
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(500, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color(0xFF6C181B),
                ),
                child: Text(
                  'INICIAR SESIÓN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}