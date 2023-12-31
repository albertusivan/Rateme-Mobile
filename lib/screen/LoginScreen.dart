import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../BottomNav.dart';
import '../api/ApiService.dart';
import 'HomeScreen.dart';
import 'RegisterScreen.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const String _title = 'Rate Me';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.only(top: 15,bottom: 15,left: 15),
            child: Image.asset('assets/whiteLogo.png'),
          ),
          title: Text('RateMe'),
        ),
        body: const MyStatefulWidget(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var emailInput = TextEditingController();
  var passwordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.brown,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/login.jpg'),
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text('Login',
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailInput,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordInput,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 32),
            Container(
                height: 52,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: ()  {
                    // var res = await userLogin(emailInput.text, passwordInput.text);
                    // if(res['error']){
                    //
                    // }else{
                    //   Navigator.of(context).pop();
                    //   var snackBar = SnackBar(content: Text(res['message']),
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => navbar()),
                    //   );
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => navbar()),
    );
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown, // Background color
                  ),
                )
            ),
            Row(
              children: <Widget>[
                const Text('already have account?'),
                TextButton(
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 14),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}

