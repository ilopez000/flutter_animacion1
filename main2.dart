import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo de Animación'),
        ),
        body: Center(
          child: AnimationDemo(),
        ),
      ),
    );
  }
}

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  double _topPosition = 0.0; // Controla la posición vertical del cuadrado.
  double _leftPosition = 0.0; // Añadido para controlar la posición horizontal del cuadrado.
  Duration _duration = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updatePosition());
  }

  void _updatePosition() {
    final random = Random();
    setState(() {
      _topPosition = random.nextDouble() * (MediaQuery.of(context).size.height - _height - 50);
      _leftPosition = random.nextDouble() * (MediaQuery.of(context).size.width - _width - 50); // Asegura que el cuadrado no se salga de la pantalla horizontalmente.
    });
  }

  void _animateContainer() {
    final random = Random();
    _width = random.nextInt(300).toDouble() + 50;
    _height = random.nextInt(300).toDouble() + 50;
    _color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    _duration = Duration(seconds: random.nextInt(5) + 1);

    _updatePosition(); // Actualiza tanto la posición vertical como la horizontal.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          // Usa margin para cambiar tanto la posición vertical como la horizontal.
          margin: EdgeInsets.only(top: _topPosition, left: _leftPosition),
          duration: _duration,
          curve: Curves.fastOutSlowIn,
        ),
        ElevatedButton(
          child: Text('Animar'),
          onPressed: _animateContainer,
        ),
      ],
    );
  }
}
