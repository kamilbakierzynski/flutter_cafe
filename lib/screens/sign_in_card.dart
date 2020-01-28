import 'package:coffee_shop/services/auth.dart';
import 'package:coffee_shop/shared/constants.dart';
import 'package:coffee_shop/widgets/loading.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class SignInCardScreen extends StatefulWidget {
  @override
  _SignInCardScreenState createState() => _SignInCardScreenState();
}

class _SignInCardScreenState extends State<SignInCardScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBECF0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xFFEBECF0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 50.0, right: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                onPressed: () => Navigator.pop(context),
                                color: Color(0xFF434668),
                                iconSize: 35.0,
                              ),
                              Text(
                                'Zaloguj się',
                                style: TextStyle(
                                    color: Color(0xFF434668),
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          ),
                          color: Color(0xFFEBECF0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white70,
                                blurRadius: 10.0,
                                spreadRadius: 10.0,
                                offset: Offset(-20.0, -6.0)),
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 10.0,
                                blurRadius: 10.0,
                                offset: Offset(6.0, 19.0))
                          ]),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40.0, left: 20.0, right: 20.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        spreadRadius: 3.0,
                                        blurRadius: 10.0,
                                        offset: Offset(6.0, 6.0)),
                                    BoxShadow(
                                        color: Colors.white70,
                                        spreadRadius: 1.0,
                                        blurRadius: 7.0,
                                        offset: Offset(-6.0, -6.0))
                                  ]),
//                                height: MediaQuery.of(context).size.width * 0.5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 40.0,
                                    left: 30.0,
                                    right: 30.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      TextFormField(
                                        validator: (val) =>  val.isEmpty ? 'Wpisz email' : null,
                                        onChanged: (val) {
                                          setState(() {
                                            email = val;
                                          });
                                        },
                                        decoration: textInputDexoration.copyWith(labelText: 'email')
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      TextFormField(
                                        validator: (val) =>  val.isEmpty ? 'Wpisz hasło' : null,
                                        onChanged: (val) {
                                          setState(() {
                                            password = val;
                                          });
                                        },
                                        obscureText: true,
                                        decoration: textInputDexoration.copyWith(labelText: 'hasło')
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  print(email);
                                  dynamic result = await _authService.signInWithEmailAndPassword(email, password);
                                  if (result == null){
                                    errorDialog(context, 'Failed to sign in');
                                    setState(() {
                                      loading = false;
                                    });
                                  } else {
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xFFEBECF0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 2.0,
                                        blurRadius: 3.0,
                                        offset: Offset(3.0, 3.0)),
                                    BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 2.0,
                                        blurRadius: 3.0,
                                        offset: Offset(-2.0, -2.0))
                                  ],
                                ),
                                child: Center(
                                  child: loading == false
                                      ? Text(
                                    'Zaloguj się',
                                    style: TextStyle(
                                        color: Color(0xFF434668),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  )
                                      : Loading(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
