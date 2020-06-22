import 'package:flutter/material.dart';
import 'package:nearby_places/appTheme.dart';
import 'package:nearby_places/services/authService.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = new AuthService();
  
  String name = '';
  String lastName = '';
  String email = '';
  String code = '';
  // TextEditingController _textFieldController = TextEditingController();
  // final UserService _userService = new UserService();
  // final UserModel userModel = new UserModel();
  // final UserPreferences pref = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _bgLogo(context),
          _inputs(context),
          SizedBox(
            height: 10.0,
          ),
          // _register(context),
        ],
      ),
    );
  }

  _bgLogo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.65,
      child: CustomPaint(
          painter: LoginPainter(),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "¡Hola!",
                        style: TextStyle(
                            fontSize: size.height * 0.03,
                            color: AppTheme.nearlyWhite,
                            letterSpacing: 4),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Bienvenido!",
                        style: TextStyle(
                            fontSize: size.height * 0.06,
                            color: AppTheme.nearlyWhite,
                            letterSpacing: 4),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: size.width * 0.9,
                  alignment: Alignment.bottomRight,
                  // margin: EdgeInsets.only(top: size.height * 0.02),
                  child: Image.asset(
                    "assets/images/directions.png",
                    fit: BoxFit.cover,
                  ),
                ),
   

                Spacer(),
              ],
            ),
          )),
    );
  }

  _inputs(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Locale myLocale = Localizations.localeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          // TextFormField(
          //     onChanged: (val) {
          //       phoneNumber = val;
          //     },
          //     initialValue: phoneNumber,
          //     keyboardType: TextInputType.number,
          //     decoration: AppTheme.inputDecoration.copyWith(
          //       hintText: "Celular",
          //       labelText: "Celular",
          //       labelStyle: TextStyle(color: AppTheme.primaryColor),
          //       prefixIcon: Icon(
          //         Icons.person_outline,
          //         color: AppTheme.primaryColor,
          //       ),
          //       suffixIcon: Icon(
          //         Icons.person,
          //         color: AppTheme.primaryColor,
          //       ),
          //     )
          //     // onSaved: (value) => person.cellPhone = value,
          //     ),
          // // Divider(),
          // SizedBox(height: 10.0),
          // SizedBox(
          //   height: 10.0,
          // ),
          // SizedBox(
          //   width: _buttonSaveWidth,
          //   child: RaisedButton(
          //     padding: EdgeInsets.all(10.0),
          //     color: AppTheme.primaryColor,
          //     onPressed: () async {
          //       setState(() {
          //         _buttonSaveWidth = 47.0;
          //       });
          //       final user =
          //           await _userService.getUserByPhoneNumber(phoneNumber);
          //       if (user != null && user.idUser != null) {
          //         pref.setUserPref(user);
          //         Navigator.pushReplacementNamed(
          //             context, pref.isStore ? "homeStore" : "home");
          //       } else {
          //         await _auth.sendVerificationCode('+57' + phoneNumber);
          //         _showDialog();
          //       }
          //     },
          //     child: _buttonSaveWidth < 300.0 ?
          //           SizedBox(
          //             child: new CircularProgressIndicator(
          //               value: null,
          //               strokeWidth: 1.0,
          //               valueColor:
          //                   new AlwaysStoppedAnimation<Color>(
          //                       Colors.white),
          //             ),
          //             height: 25.0,
          //           )
          //           : const Text('LOGIN',
          //             style: TextStyle(
          //               fontSize: 20,
          //               color: AppTheme.nearlyWhite,
          //               letterSpacing: 5.0,
          //               fontWeight: FontWeight.w700)),
          //   ),
          // ),
          // SizedBox(
          //   height: 10.0,
          // ),

          
          // SizedBox(
          //   width: 50.0,
          //   height: 50.0,
          //   child: RaisedButton(
          //     onPressed: () {},
          //     padding: EdgeInsets.all(1.0),
          //     child: Icon(Icons.face),
          //   ),
          // ),

        ],
      ),
    );
  }

  // _socialMediaButtons(BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: <Widget>[
  //       SizedBox(
  //         width: 40.0,
  //       ),
  //       SizedBox(
  //         width: 50.0,
  //         height: 50.0,
  //         child: RaisedButton(
  //           color: AppTheme.primaryColor,
  //           onPressed: () async {
  //             setState(() {
  //               _buttonSaveWidth = 47.0;
  //             });
  //             final FirebaseUser user = await _auth.googleSignin();
  //             if (user == null || user.uid == null) {
  //               print('error signing in');
  //               setState(() {
  //                 _buttonSaveWidth = 300.0;
  //               });
  //             } else {
  //               userModel.idUser = user.uid;
  //               userModel.img = user.photoUrl;
  //               userModel.isStore = pref.isStore;
  //               userModel.email = user.email;
  //               userModel.name = user.displayName;
  //               await _userService.saveUser(userModel);
  //               Navigator.pushReplacementNamed(
  //                   context, pref.isStore ? "homeStore" : "home");
  //             }
  //           },
  //           padding: EdgeInsets.all(1.0),
  //           child: Icon(
  //             FontAwesomeIcons.google,
  //             color: AppTheme.nearlyWhite,
  //           ),
  //         ),
  //       ),
  //       SizedBox(
  //         width: 50.0,
  //         height: 50.0,
  //         child: RaisedButton(
  //           color: AppTheme.primaryColor,
  //           onPressed: () async {
  //             setState(() {
  //               _buttonSaveWidth = 47.0;
  //             });
  //             dynamic user = await _auth.fbSignIn();
  //             if (user == null || user.uid == null) {
  //               print('error signing in');
  //               setState(() {
  //                 _buttonSaveWidth = 300.0;
  //               });
  //             } else {
  //               _showDialogTransparent();
  //               userModel.idUser = user.uid;
  //               userModel.img = user.photoUrl;
  //               userModel.isStore = pref.isStore;
  //               userModel.email = user.email;
  //               userModel.name = user.displayName;
  //               await _userService.saveUser(userModel);
  //               Navigator.pushReplacementNamed(
  //                   context, pref.isStore ? "homeStore" : "home");
  //             }
  //           },
  //           padding: EdgeInsets.all(1.0),
  //           child: Icon(
  //             FontAwesomeIcons.facebookF,
  //             color: AppTheme.nearlyWhite,
  //           ),
  //         ),
  //       ),
  //       // SizedBox(
  //       //   width: 50.0,
  //       //   height: 50.0,
  //       //   child: RaisedButton(
  //       //     onPressed: () {},
  //       //     padding: EdgeInsets.all(1.0),
  //       //     child: Icon(Icons.face),
  //       //   ),
  //       // ),
  //       SizedBox(
  //         width: 40.0,
  //       ),
  //     ],
  //   );
  // }

  // _register(BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Text("No tengo una cuenta?"),
  //       FlatButton(
  //         onPressed: () {
  //           Navigator.pushReplacementNamed(context, 'register');
  //         },
  //         child: Text(
  //           "REGISTRARME",
  //           style: TextStyle(color: AppTheme.primaryColor),
  //         ),
  //       )
  //     ],
  //   );
  // }

  // Future<void> _showDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Registro'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text('Ingresa los siguientes datos para finalizar el registro'),
  //               TextFormField(
  //                 onChanged: (val) {
  //                   name = val;
  //                 },
  //                 initialValue: '',
  //                 keyboardType: TextInputType.text,
  //                 decoration: AppTheme.inputDecoration.copyWith(
  //                   hintText: "Nombre",
  //                   labelText: "Nombre",
  //                   labelStyle: TextStyle(color: AppTheme.primaryColor),
  //                 ),
  //               ),
  //               Divider(),
  //               TextFormField(
  //                 onChanged: (val) {
  //                   lastName = val;
  //                 },
  //                 initialValue: '',
  //                 keyboardType: TextInputType.text,
  //                 decoration: AppTheme.inputDecoration.copyWith(
  //                   hintText: "Apellidos",
  //                   labelText: "Apellidos",
  //                   labelStyle: TextStyle(color: AppTheme.primaryColor),
  //                 )
  //               ),
  //               Divider(),
  //               TextFormField(
  //                 onChanged: (val) {
  //                   code = val;
  //                 },
  //                 initialValue: '',
  //                 keyboardType: TextInputType.number,
  //                 decoration: AppTheme.inputDecoration.copyWith(
  //                   hintText: "Codigo",
  //                   labelText: "Ingresa tu codigo",
  //                   labelStyle: TextStyle(color: AppTheme.primaryColor),
  //                 )
  //               )
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Cancelar'),
  //             onPressed: () {
  //               setState(() {
  //                 _buttonSaveWidth = 300.0;
  //               });
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           FlatButton(
  //             child: Text('Ok'),
  //             onPressed: () async {
  //               Future.delayed(const Duration(milliseconds: 1000), () async {
  //                 dynamic user = await _auth.signInWithPhoneNumber(code);
  //                 if (user == null || user.uid == null) {
  //                   print('error signing in');
  //                 } else {
  //                   userModel.idUser = user.uid;
  //                   userModel.name = name.trim();
  //                   userModel.lName = lastName.trim();
  //                   userModel.phone = phoneNumber.trim();
  //                   userModel.isStore = pref.isStore;
  //                   await _userService.saveUser(userModel);
  //                   setState(() {
  //                     _buttonSaveWidth = 300.0;
  //                   });
  //                   Navigator.pushReplacementNamed(context, pref.isStore? "homeStore" : "home");
  //                 }
  //               });
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Future<void> _showDialogTransparent() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context)
              .copyWith(dialogBackgroundColor: Colors.transparent),
          child: AlertDialog(),
        );
      },
    );
  }

  void _openLoadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog();
      },
    );
  }
}

class LoginPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // paint.color = Colors.green[800];

    var rect = Offset.zero & size;

    var gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
      colors: AppTheme.colorsGradient, // whitish to gray
      // tileMode: TileMode.repeated, // repeats the gradient over the canvas
    );

    paint.shader = gradient.createShader(rect);

    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.8,
        size.width * 0.3, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.6,
        size.width * 0.7, size.height * 0.79);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 1, size.width, size.height * 0.85);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
