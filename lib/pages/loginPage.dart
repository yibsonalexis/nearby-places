import 'package:flutter/material.dart';
import 'package:nearby_places/appTheme.dart';
import 'package:nearby_places/services/loginService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginService _login = LoginService();
  double _buttonSaveWidth = 300;

  String userName = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) => _body(context)),
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
          _register(context),
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
          TextFormField(
              onChanged: (val) {
                userName = val;
              },
              initialValue: userName,
              keyboardType: TextInputType.number,
              decoration: AppTheme.inputDecoration.copyWith(
                hintText: "Usuario",
                labelText: "Usuario",
                labelStyle: TextStyle(color: AppTheme.primaryColor),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: AppTheme.primaryColor,
                ),
                suffixIcon: Icon(
                  Icons.person,
                  color: AppTheme.primaryColor,
                ),
              )
              ),
          SizedBox(height: 10.0),
          TextFormField(
              onChanged: (val) {
                userName = val;
              },
              initialValue: userName,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: AppTheme.inputDecoration.copyWith(
                hintText: "Contraseña",
                labelText: "Contraseña",
                labelStyle: TextStyle(color: AppTheme.primaryColor),
                prefixIcon: Icon(
                  Icons.lock,
                  color: AppTheme.primaryColor,
                ),
                suffixIcon: Icon(
                  Icons.vpn_key,
                  color: AppTheme.primaryColor,
                ),
              )
              ),
          Divider(),
          SizedBox(height: 10.0),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: _buttonSaveWidth,
            child: RaisedButton(
              padding: EdgeInsets.all(10.0),
              color: AppTheme.primaryColor,
              onPressed: () async {
                setState(() {
                  _buttonSaveWidth = 47.0;
                });
                if (await _login.login(userName, password)) {
                  Navigator.pushReplacementNamed(context, "home");
                } else {
                  Scaffold.of(context).showSnackBar(new SnackBar(
                    backgroundColor: Colors.red,
                    content: new Text('Usuario y/o contraseña incorrectos'),
                    duration: Duration(seconds: 5),
                  ));
                  setState(() {
                    _buttonSaveWidth = 300.0;
                  });
                }
              },
              child: _buttonSaveWidth < 300.0
                  ? SizedBox(
                      child: new CircularProgressIndicator(
                        value: null,
                        strokeWidth: 1.0,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                      height: 25.0,
                    )
                  : const Text('LOGIN',
                      style: TextStyle(
                          fontSize: 20,
                          color: AppTheme.nearlyWhite,
                          letterSpacing: 5.0,
                          fontWeight: FontWeight.w700)),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  _register(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("No tengo una cuenta?"),
        FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
          child: Text(
            "REGISTRARME",
            style: TextStyle(color: AppTheme.primaryColor),
          ),
        )
      ],
    );
  }
}

class LoginPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var rect = Offset.zero & size;
    var gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 0.0),
      colors: AppTheme.colorsGradient,
    );

    paint.shader = gradient.createShader(rect);

    paint.style = PaintingStyle.fill;

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
    return false;
  }
}
