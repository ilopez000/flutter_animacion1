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
  // Propiedades iniciales del contenedor
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  // Agregar duration como variable de estado
  Duration _duration = Duration(seconds: 1);

  void _animateContainer() {
    // Genera un estado aleatorio para la animación
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

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedContainer(
          // Usa las propiedades para la animación
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          // Duración de la animación
          duration: _duration,
          // Opcional: elige un tipo de curva de animación
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
