import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nearby_places/appTheme.dart';
import 'package:nearby_places/models/userModel.dart';
import 'package:nearby_places/services/registerService.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final UserModel _userModel = UserModel();
  final RegisterService _registerService = RegisterService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  double _buttonSaveWidth = 300.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      return Column(
        children: <Widget>[
          _UserInformation(),
          Expanded(child: SingleChildScrollView(child: _body(context))),
        ],
      );
    }));
  }

  void _validateInputs(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        _buttonSaveWidth = 50.0;
      });

      var res = await _registerService.saveUser(_userModel);

      if (res != null) {
        setState(() {
          _buttonSaveWidth = 300.0;
        });
        Scaffold.of(context).showSnackBar(new SnackBar(
          backgroundColor: Colors.green,
          content: new Text('Gurdado con Éxito'),
          duration: Duration(seconds: 5),
        ));
        Timer(Duration(seconds: 5), () {
          Navigator.pushReplacementNamed(context, "home");
        });
      } else {
        setState(() {
          _buttonSaveWidth = 300.0;
        });
        Scaffold.of(context).showSnackBar(new SnackBar(
          backgroundColor: Colors.red,
          content: new Text('Error guardando información'),
          duration: Duration(seconds: 5),
        ));
      }
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Widget _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14.0),
      child: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: Column(
          children: <Widget>[
            TextFormField(
              initialValue: _userModel.name,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              decoration: AppTheme.inputDecoration.copyWith(
                border: OutlineInputBorder(),
                hintText: "Nombre",
                labelText: "Nombre",
                suffixIcon: Icon(Icons.accessibility_new),
              ),
              onSaved: (value) => _userModel.name = value,
              validator: (value) {
                if (value.length < 1) return "El campo es requerido";
                if (value.length >= 50)
                  return "El campo supera la cantidad máxima requerida";
                return null;
              },
            ),
            Divider(),
            TextFormField(
              initialValue: _userModel.lName,
              textCapitalization: TextCapitalization.sentences,
              decoration: AppTheme.inputDecoration.copyWith(
                border: OutlineInputBorder(),
                hintText: "Apellido",
                labelText: "Apellido",
                suffixIcon: Icon(Icons.person_outline),
              ),
              onSaved: (value) => _userModel.lName = value,
              validator: (value) {
                if (value.length < 1) return "El campo es requerido";
                if (value.length >= 50)
                  return "El campo supera la cantidad máxima requerida";
                return null;
              },
            ),
            Divider(),
            TextFormField(
              initialValue: _userModel.userName,
              textCapitalization: TextCapitalization.none,
              decoration: AppTheme.inputDecoration.copyWith(
                border: OutlineInputBorder(),
                hintText: "Nombre de usuario",
                labelText: "Nombre de usuario",
                suffixIcon: Icon(Icons.perm_identity),
              ),
              onSaved: (value) => _userModel.userName = value,
              validator: (value) {
                if (value.length < 1) return "El campo es requerido";
                if (value.length >= 200)
                  return "El campo supera la cantidad máxima requerida";
                return null;
              },
            ),
            Divider(),
            TextFormField(
              initialValue: _userModel.lName,
              textCapitalization: TextCapitalization.none,
              obscureText: true,
              decoration: AppTheme.inputDecoration.copyWith(
                border: OutlineInputBorder(),
                hintText: "Contraseña",
                labelText: "Contraseña",
                suffixIcon: Icon(Icons.vpn_key),
              ),
              onSaved: (value) => _userModel.lName = value,
              validator: (value) {
                if (value.length < 1) return "El campo es requerido";
                if (value.length < 6) return "Debe tener mínimo 6 caracteres";
                if (value.length >= 50)
                  return "El campo supera la cantidad máxima requerida";
                return null;
              },
            ),
            Divider(),
            InkWell(
              onTap: () =>
                  {if (_buttonSaveWidth > 60.0) _validateInputs(context)},
              borderRadius: BorderRadius.circular(25.0),
              child: AnimatedContainer(
                  width: _buttonSaveWidth,
                  height: 50.0,
                  duration: Duration(milliseconds: 300),
                  alignment: FractionalOffset.center,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: AppTheme.colorsGradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.all(Radius.circular(80.0))),
                  // padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15.0),
                  child: _buttonSaveWidth > 60.0
                      ? new Text(
                          "GUARDAR",
                          style: new TextStyle(
                            color: AppTheme.nearlyWhite,
                            fontSize: 20.0,
                            letterSpacing: 0.8,
                          ),
                        )
                      : _buttonSaveWidth <= 60.0
                          ? new CircularProgressIndicator(
                              value: null,
                              strokeWidth: 1.0,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.white),
                            )
                          : null),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: CustomPaint(
        painter: _CustomPainter(),
        child: SafeArea(
          bottom: false,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _nameInformation(context)),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 120,
                  height: 120,
                  child: ClipOval(
                      child: Image.asset(
                    "assets/images/robot.png",
                    fit: BoxFit.cover,
                  )),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10.0,
                          color: Colors.white24,
                          offset: Offset(0, 5),
                          spreadRadius: 5.0)
                    ],
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameInformation(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerLeft,
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            }),
        Text(
          "Registrar Información",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        )
      ],
    );
  }
}

class _CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double height = size.height + 30;

    var rect = Offset.zero & size;

    var gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
      colors: AppTheme.colorsGradient, // whitish to gray
      // tileMode: TileMode.repeated, // repeats the gradient over the canvas
    );

    var paint = Paint();
    paint.shader = gradient.createShader(rect);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();
    path.moveTo(0, height * 0.55);
    path.quadraticBezierTo(
        size.width * 0.1, height * 0.8, size.width * 0.3, height * 0.7);

    path.quadraticBezierTo(
        size.width * 0.45, height * 0.6, size.width * 0.63, height * 0.76);

    path.quadraticBezierTo(
        size.width * 0.85, height, size.width, height * 0.73);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
