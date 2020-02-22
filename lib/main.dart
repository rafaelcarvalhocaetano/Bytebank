import 'package:flutter/material.dart';

void main() => runApp(

    Column(
      children: <Widget>[
        Text('Rafael Carvalho', textDirection: TextDirection.ltr,),
        Text('FLUTTER', textDirection: TextDirection.ltr),
        Expanded(
          child: FittedBox(
            fit: BoxFit.contain,
            child: const FlutterLogo(),
          ),
        )
      ],
    )
    );
