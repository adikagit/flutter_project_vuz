
import 'package:adivuz/screeens/information/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:iconsax/iconsax.dart';
import 'package:progress_state_button/progress_button.dart';

class ButtonsInfo extends StatefulWidget {
  const ButtonsInfo({Key? key}) : super(key: key);

  @override
  _ButtonsInfoState createState() => _ButtonsInfoState();
}

class _ButtonsInfoState extends State<ButtonsInfo> {
  ButtonState stateTextWithIconMinWidthState = ButtonState.idle;
  @override
  Widget build(BuildContext context) {
    final number = '+996706868633';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 62,
          width: 62,
          child: FloatingActionButton(
            heroTag: "btn1",
            foregroundColor: txtColor,
            backgroundColor: Colors.white,
            onPressed: () async {
              await FlutterPhoneDirectCaller.callNumber(number);
            },
            child: Icon(Icons.phone, size: 30,),
          ),
        ),
        SizedBox(width: 35),
        Container(
          height: 62,
          width: 62,
          child: FloatingActionButton(
            heroTag: "btn2",
            foregroundColor: txtColor,
            backgroundColor: Colors.white,
            onPressed: ()=> showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20)
                    )
                ),
                isDismissible: true,
                isScrollControlled: true,
                enableDrag: true,
                context: context,
                builder: (context)=>buildSheet()),
            child: Icon(Icons.mail_outline_outlined,size: 30,),
          ),
        ),
        SizedBox(width: 35),
        Container(
          height: 62,
          width: 62,
          child: FloatingActionButton(
            heroTag: "btn3",
            foregroundColor: txtColor,
            backgroundColor: Colors.white,
            onPressed: (){},
            child: Icon(Iconsax.map_1, size: 30,),
          ),
        ),
      ],
    );
  }

  Widget buildSheet()=> Container(
    height: 630,
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Divider(
          height: 10,
          thickness: 3,
            indent: 160,
            endIndent: 160,
            color: Colors.black54
        ),
        SizedBox(height: 20,),
        TextField(
          onChanged: (String value){
            // _name = value;
          },
          decoration: InputDecoration(
              labelText: 'Тема',
              labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black87
              ),
              hintText: 'Ввод',
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black45
              ),
              border: OutlineInputBorder()
          ),
          obscureText: false,
        ),
        SizedBox(height: 12,),
        TextField(
          maxLines: 5,
          cursorHeight: 20,
          onChanged: (String value){
            // _name = value;
          },
          decoration: InputDecoration(
              labelText: 'Описание темы',
              labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black87
              ),
              hintText: 'Ввод',
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black45
              ),
              border: OutlineInputBorder()
          ),
          obscureText: false,
          maxLength: 500,
        ),
        SizedBox(height: 12,),
        TextField(
          onChanged: (String value){
            // _name = value;
          },
          decoration: InputDecoration(
              labelText: 'Ваш mail',
              labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black87
              ),
              hintText: 'mail',
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black45
              ),
              border: OutlineInputBorder()
          ),
          obscureText: false,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20,left: 300),
          child: FloatingActionButton(
              onPressed: () {},//Get.to(Dobovlenie()),
              tooltip: 'Отправка',
              child: Icon(Icons.arrow_forward_outlined, size: 25,color:Colors.white),
            ),
        ),
      ],
    ),
  );

}
