import 'package:adivuz/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color greennn = Color(0xff6ed268);
Color blueee = Color(0xFF5F89FF);
Color yellowww = Color(0xFFD1DC33);
Color reddd = Color(0xFFFF5151);

class MyInputFiled extends StatelessWidget{
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  String? vvv;
  MyInputFiled({Key? key,
    required this.title,
    required this.hint,
    this.vvv,
    this.controller,
    this.widget,}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: sub2,),
          Container(
              height: 52,
              margin: EdgeInsets.only(top: 8.0),
              padding: EdgeInsets.only(left: 14),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      width: 1.3
                  ),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        onChanged: (String value){
                          vvv=value;
                        },
                        readOnly: widget==null?false:true,
                        autocorrect: false,
                        cursorColor: Colors.grey[600],
                        controller: controller,
                        style: sub3,
                        decoration: InputDecoration(
                            hintText: hint,
                            hintStyle: sub3,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: boxColor,
                                  width: 0,
                                )
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: boxColor,
                                  width: 0,
                                )
                            )
                        ),
                      )
                  ),
                  widget==null?Container():Container(child: widget,),
                ],
              )
          ),
        ],
      ),
    );
  }
}


TextStyle get sub1{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700]
      )
  );
}
TextStyle get sub2{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.grey[700]
      )
  );
}
TextStyle get sub3{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey[650]
      )
  );
}