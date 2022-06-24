import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(sharedPreferance());
}

 SharedPreferences? prefs;

TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

class sharedPreferance extends StatelessWidget {

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferance Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 200),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "UserName", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey,
                          filled: true
                      ),
                    )
                  ],
                ),
              ), Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "PassWord", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey,
                          filled: true
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              RaisedButton(
                onPressed: save,
                child: Text('Login'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              if (prefs != null)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "User Logged in!!! ->  Email Id: ${prefs!.get(
                        'email')}  Password: ${prefs!.get('password')}",
                    style: TextStyle(fontSize: 20,color: Colors.blue),),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

save() async {
  await sharedPreferance.init();
  prefs!.setString('email', emailController.text.toString());
  prefs!.setString('password', passwordController.text.toString());
}


