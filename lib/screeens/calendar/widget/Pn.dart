import 'package:flutter/material.dart';

class Pn extends StatefulWidget {
  const Pn({Key? key}) : super(key: key);

  @override
  _PnState createState() => _PnState();
}

class _PnState extends State<Pn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(child:Text("1")),
    );
  }
}
