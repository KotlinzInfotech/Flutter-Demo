import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Google SignIn',
      home: MyHomePage(title: 'Firebase Authentication'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  Future<FirebaseApp> firebaseApp;
  bool isLoggedIn = false;
  String name = "";

  @override
  void initState() {
    firebaseApp = Firebase.initializeApp();
    super.initState();
  }

  void googleSignIn() async {
    final googleSinIn = GoogleSignIn();
    final signInAccount = await googleSinIn.signIn();

    final googleAccountAuthentication = await signInAccount.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAccountAuthentication.accessToken,
        idToken: googleAccountAuthentication.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);

    if (FirebaseAuth.instance.currentUser != null) {
      print('Google Authentication Successful');
      print('${FirebaseAuth.instance.currentUser.displayName} signed in.');
      setState(() {
        isLoggedIn = true;
        name = FirebaseAuth.instance.currentUser.displayName;
      });
    } else {
      print('unable to sign in');
    }
  }

  void googleSignOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      isLoggedIn = false;
      name = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: firebaseApp,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator(),);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  isLoggedIn ? Text('$name signed in.') : Text(''),
                  ElevatedButton(
                    onPressed: isLoggedIn ? googleSignOut : googleSignIn,
                    child: isLoggedIn ? Text('Sign Out') : Text('Sign In with Google'),
                  )
                ],
              ),
            );
          }),
    );
  }
}
