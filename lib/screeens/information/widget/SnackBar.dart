import 'dart:ui';

import 'package:adivuz/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Snackbar extends StatelessWidget{
  final String text;
  final IconData icon;
  Snackbar({Key? key,
    required this.text,
    required this.icon, }): super(key: key);

  Widget build(BuildContext context) {
    return snak(context);
  }
  snak(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: EdgeInsets.only(left: 15, right: 15),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          backgroundColor: Colors.red,
          //behavior: SnackBarBehavior.floating,
        )
    );
  }
}


