import 'package:coffee_shop/screens/register.dart';
import 'package:coffee_shop/services/auth.dart';
import 'package:coffee_shop/shared/constants.dart';
import 'package:coffee_shop/widgets/loading.dart';
import 'package:coffee_shop/widgets/top_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:commons/commons.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _formKeyReset = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool loading = false;

  // text field

  String email = '';
  String password = '';
  String emailReset = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TopNavigationBar(),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Zaloguj się',
                                    style: TextStyle(
                                        color: Color(0xFF1E3932),
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0),
                                  ),
                                  Text(
                                    'albo zarejestruj',
                                    style: TextStyle(
                                        color: Color(0xFF1E3932),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40.0, left: 20.0, right: 20.0),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  TextFormField(
                                      validator: (val) => val.isEmpty
                                          ? 'Wpisz email'
                                          : null,
                                      onChanged: (val) {
                                        setState(() {
                                          email = val;
                                        });
                                      },
                                      decoration:
                                          textInputDexoration.copyWith(
                                              labelText: 'email')),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextFormField(
                                      validator: (val) => val.isEmpty
                                          ? 'Wpisz hasło'
                                          : null,
                                      onChanged: (val) {
                                        setState(() {
                                          password = val;
                                        });
                                      },
                                      obscureText: true,
                                      decoration:
                                          textInputDexoration.copyWith(
                                              labelText: 'hasło')),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
//                                showModalBottomSheet(context: null, builder: null)
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return SingleChildScrollView(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0),
                                                  child: Text(
                                                    'Podaj adres email do zresetowania hasła',
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0),
                                                  child: Form(
                                                    key: _formKeyReset,
                                                    child: TextFormField(
                                                      validator: (val) {
                                                        if (val.isEmpty ||
                                                            !val.contains(
                                                                '@')) {
                                                          return 'Wprowadź poprawny adres email';
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      onChanged: (val) {
                                                        setState(() {
                                                          emailReset = val;
                                                        });
                                                      },
                                                      decoration:
                                                          textInputDexoration
                                                              .copyWith(
                                                                  labelText:
                                                                      'email'),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      if (_formKeyReset
                                                          .currentState
                                                          .validate()) {
                                                        AuthService()
                                                            .resetPassword(
                                                                emailReset);
                                                        _scaffoldKey
                                                            .currentState
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content: Text(
                                                              'Link do resetu hasła został wysłany na adres ' +
                                                                  emailReset),
                                                          duration: Duration(
                                                              seconds: 4),
                                                        ));
                                                        Navigator.pop(context);
                                                        emailReset = '';
                                                      }
                                                    },
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                        color:
                                                            Color(0xFFEBECF0),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors
                                                                  .black12,
                                                              spreadRadius: 2.0,
                                                              blurRadius: 3.0,
                                                              offset: Offset(
                                                                  3.0, 3.0)),
                                                          BoxShadow(
                                                              color:
                                                                  Colors.white,
                                                              spreadRadius: 2.0,
                                                              blurRadius: 3.0,
                                                              offset: Offset(
                                                                  -2.0, -2.0))
                                                        ],
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        'Resetuj hasło',
                                                        style: TextStyle(
                                                            color: Color(0xFF243F38),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17.0),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
//                                AuthService().resetPassword(email: null)
                              },
                              child: Text(
                                'Zapomniałeś hasła?',
                                style: TextStyle(color: Color(0xFF243F38)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            RegisterScreen(mode: 0)));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: 50.0,
                                child: Center(
                                  child: Text(
                                    'Zarejestruj się',
                                    style: TextStyle(
                                        color: Color(0xFF243F38),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  print(email);
                                  dynamic result = await _authService
                                      .signInWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                    });
                                    print('Error');
                                    errorDialog(
                                        context, 'Wystąpił błąd z logowaniem');
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
                                              color: Color(0xFF243F38),
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
