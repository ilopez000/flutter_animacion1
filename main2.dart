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
  double _topPosition = 0.0; // Para controlar la posición vertical del contenedor.
  Duration _duration = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updatePosition());
  }

  void _updatePosition() {
    final random = Random();
    // Asegúrate de llamar a setState en un lugar donde sea seguro (por ejemplo, como respuesta a una acción del usuario o después del primer frame).
    setState(() {
      _topPosition = random.nextDouble() * (MediaQuery.of(context).size.height - _height - 50); // Asegura que el contenedor no se salga de la pantalla.
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
    // Actualiza la duración de la animación.
    _duration = Duration(seconds: random.nextInt(5) + 1);

    // Actualizar la posición dentro de la animación para evitar errores.
    _updatePosition();
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
          // Usa un margin para cambiar la posición vertical.
          margin: EdgeInsets.only(top: _topPosition),
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
