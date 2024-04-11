import 'package:flutter/material.dart';

import '../ui_constants.dart';

class EmptyWidget extends StatelessWidget {
  final VoidCallback onTap;

  const EmptyWidget({Key? key,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/welcome.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: maxPageWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/logo.png',
                    height: 55,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    'Hola,\nBienvenido',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Qué te parece si agregamos\nuna nueva ciudad?',
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    child: const Text('Agregar ciudad'),
                    onPressed: onTap,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
