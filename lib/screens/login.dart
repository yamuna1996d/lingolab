import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lingolab/screens/forgotpassword.dart';
import 'package:lingolab/screens/signup.dart';
//import 'package:lingolab/screens/forgotpassword.dart';
import 'package:lingolab/widgets/textfields.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pass = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    print(appWidth*.09);
    print(appHeight);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.1,
                      0.3,
                    ],
                    colors: [
                      Colors.redAccent,
                      Colors.deepOrangeAccent,
                    ])
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(appWidth*.23,0,0,0),
            child: Container(
                width: 210.00,
                height: appHeight*.3,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: ExactAssetImage('assets/lingolabwhite.png'),
                    fit: BoxFit.fitWidth,
                  ),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,appHeight*.25,0,0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: appHeight,
                    width: appWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight:  Radius.circular(50),topLeft:Radius.circular(50) ),
                      color: Colors.white,
                    ),
                    child:SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Column(

                          children: <Widget>[
                            SizedBox(height: 10),
                            Text("LogIn",
                                style: TextStyle(fontSize:30.0 ,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFFF616161),
                                )
                            ),

                            SizedBox(height: appHeight*.04),
                            email(),

                            SizedBox(height: appHeight*.04),
                            password(),

                            SizedBox(height: appHeight*.04),
                            forgotPassword(),
                            SizedBox(height: appHeight*.04),
                            submitButton(),
                            _divider(),
                            socialIconsRow(),
                            SizedBox(height: appHeight*.04),
                            _createAccountLabel(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget email(){
    return CustomTextField(
      hint:"Email ID",
      icon: Icons.email,
      controller: emailcontroller,
    );
  }

//  Widget password(){
//    return CustomTextField(
//      hint:"Password",
//      icon: Icons.lock,
//    );
//  }
  Widget password() {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width*.92,
      decoration: BoxDecoration(
        color: Color(0xFFFf7f7f7),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 7),
            blurRadius: 12,
            spreadRadius: 0,
            color: Colors.grey,
          ),
        ],
      ),
      child: TextField(
        controller: pass,
        obscureText: !_showPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock,color: Colors.deepOrangeAccent,),
          border: InputBorder.none,
          hintText: "Password",
          suffixIcon: GestureDetector(
            onTap: () {
              _togglevisibility();
            },
            child: Icon(
              _showPassword ? Icons.visibility : Icons
                  .visibility_off, color: Colors.deepOrangeAccent,),
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget socialIconsRow() {
    return Container(

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              signInGoogle();
            },
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/google.jpg"),
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/facebook.jpg"),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUp()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: EdgeInsets.all(5),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Don't have an account ?",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'SignUp',
              style: TextStyle(
                  color: Color(0xff00a2e1),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget forgotPassword() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPassword()),
        );
      },
      child: Container(

        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*.67, 0, 0, 0),
        alignment: Alignment.bottomCenter,
        child: Row(

          children: <Widget>[

            Text(
              'Forgot Password?',
              style: TextStyle(
                  color: Color(0xff00a2e1),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget submitButton(){
    return RaisedButton(
      onPressed: (){
        _signIn();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.3,],
                colors: [
                  Colors.redAccent,
                  Colors.deepOrangeAccent,
                ]),
            borderRadius: BorderRadius.circular(30.0)
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text("Submit",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
  void _signIn() async {
    String email = emailcontroller.text.trim();
    String password = pass.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((user){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
      }).catchError((e){
        showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: Text("Error"),
                content: Text("${e.message}"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      emailcontroller.text = "";
                      pass.text = "";

                      Navigator.of(ctx).pop();
                    },
                  )
                ],
              );
            });
      });
    }
    else {
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
          title: Text("Error"),
          content: Text("Please provide email and password......!"),
          actions: <Widget>[
            FlatButton(child: Text("Cancel"),
              onPressed: () {
                emailcontroller.text = "";
                pass.text = "";
                Navigator.of(ctx).pop();
              },
            )
          ],
        );
      });
    }
    _auth.signInWithEmailAndPassword(email: email, password: password);
  }
  void signInGoogle()async{
    try{
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
    }
    catch(e){
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
          title: Text("Error"),
          content: Text("${e.message}"),
          actions: <Widget>[
            FlatButton(child: Text("Cancel"),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        );

      });
    }
  }
}
