import 'package:adivuz/screeens/calendar/dobovlenie/const.dart';
import 'package:flutter/material.dart';

class ButtonsCalen extends StatefulWidget {
  final ValueChanged<String> action; //callback value change
  final String tag; //tag of button
  final String buttonName;
  final String textName;
  final bool active; // state of button
  ButtonsCalen(
      {required this.action,
      required this.buttonName,
      required this.active,
      required this.tag,
      required this.textName});
  @override
  _ButtonsCalenState createState() => _ButtonsCalenState();
}

class _ButtonsCalenState extends State<ButtonsCalen> {
  void handleTap() {
    setState(() {
      widget.action(widget.tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    double circleBoxSize = 60.0;
    return Container(
      child: TextButton(
        onPressed: handleTap,
        child: Container(
          width: circleBoxSize,
          height: circleBoxSize,
          decoration: BoxDecoration(
              gradient: widget.active
                  ? LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                          Color.fromRGBO(79, 172, 254, 1),
                          Color.fromRGBO(0, 242, 245, 1)
                        ])
                  : null,
              shape: BoxShape.circle,
              color: widget.active ? null : Color.fromRGBO(227, 230, 238, 1)),
          child: Center(
            child: Text(
              this.widget.textName,
              style: TextStyle(
                  color:
                      widget.active ? Color.fromRGBO(255, 255, 255, 1) : null,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
