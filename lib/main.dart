import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 1',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _username;
  late final TextEditingController _password;

  @override
  void initState() {
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Center(
            child: SizedBox(
              width: 400,
              height: 500,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(20, 121, 11, 154),
                    borderRadius: BorderRadius.all(Radius.circular(28))),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title
                      const Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),

                      // HR
                      const Padding(
                        padding:
                            EdgeInsets.only(bottom: 4.0, left: 40, right: 40),
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(111, 0, 0, 0),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text("Silahkan login terlebih dahulu."),
                      ),

                      // Username Textfield
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: _username,
                          decoration: const InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(114, 0, 0, 0)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)))),
                        ),
                      ),

                      // Password Textfield
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          obscureText: true,
                          controller: _password,
                          decoration: const InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(114, 0, 0, 0)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)))),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: SizedBox(
                            width: 340,
                            child: ElevatedButton(
                                onPressed: () {
                                  final user = _username.text;
                                  final pass = _password.text;

                                  if (user == 'admin' && pass == 'admin') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Login berhasil!'),
                                      backgroundColor: Colors.green,
                                      duration: Duration(seconds: 2),
                                    ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content:
                                          Text('Username atau Password salah!'),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 2),
                                    ));
                                  }
                                },
                                child: const Text("Login"))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
