import 'package:coffee_shop/services/auth_service.dart';
import 'package:coffee_shop/shared/constants.dart';
import 'package:coffee_shop/widgets/loading.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final int mode;

  RegisterScreen({this.mode});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field

  String email = '';
  String password = '';
  String confirmPassword = '';
  String name = '';
  String error = '';
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
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 50.0, right: 15.0),
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
                                'Zarejestruj się',
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
                                        validator: (val) =>
                                            val.isEmpty ? 'Wpisz imię' : null,
                                        onChanged: (val) {
                                          setState(() {
                                            name = val;
                                          });
                                        },
                                        decoration: textInputDecoration.copyWith(labelText: 'imię')
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      TextFormField(
                                        validator: (val) =>
                                            val.isEmpty ? 'Wpisz email' : null,
                                        onChanged: (val) {
                                          setState(() {
                                            email = val;
                                          });
                                        },
                                        decoration: textInputDecoration.copyWith(labelText: 'email')
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      TextFormField(
                                        validator: (val) => val.length < 6
                                            ? 'Hasło musi się składać z minimalnie 6 znaków'
                                            : null,
                                        onChanged: (val) {
                                          setState(() {
                                            password = val;
                                          });
                                        },
                                        obscureText: true,
                                        decoration: textInputDecoration.copyWith(labelText: 'hasło')
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      TextFormField(
                                        validator: (val) => val != password
                                            ? 'Hasła nie są jednakowe'
                                            : null,
                                        onChanged: (val) {
                                          setState(() {
                                            confirmPassword = val;
                                          });
                                        },
                                        obscureText: true,
                                        decoration: textInputDecoration.copyWith(labelText: 'powtórz hasło')
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
                          mainAxisAlignment: widget.mode == 0 ? MainAxisAlignment.spaceAround : MainAxisAlignment.center,
                          children: <Widget>[
                            widget.mode == 0
                                ? GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height: 50.0,
                                      child: Center(
                                        child: Text(
                                          'Zaloguj się',
                                          style: TextStyle(
                                              color: Color(0xFF434668),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.0),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  print(name);
                                  print(email);
                                  print(password);
                                  print(confirmPassword);
                                  dynamic result = await _authService
                                      .registerWithEmailAndPassword(
                                          email, password, name);
                                  if (result == null) {
                                    errorDialog(context, 'Failed to sign in');
                                    setState(() {
                                      error = 'Podaj prawidłowy adres e-mail';
                                      loading = true;
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
                                    'Zarejestruj się',
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
