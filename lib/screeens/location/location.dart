import 'dart:ui';
import 'package:adivuz/const.dart';
import 'package:adivuz/screeens/information/dobovlenie/dobovlenieInfor.dart';
import 'package:adivuz/screeens/location/widget/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: boxColor2,
      appBar: AppBar(
        elevation: 0,
        title: Text("Поиск", style: TextStyle(color: boxColor),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20*2.5),
              height: size.height * 0.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: size.height * 0.105 - 27,
                    decoration: BoxDecoration(
                      color: glColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      )
                    ),

                  ),
                  Positioned(
                    bottom: 83,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 22),
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0,10),
                              blurRadius: 50,
                              color: kPrimaryColor.withOpacity(0.23),
                            )
                          ],
                        ),
                        child: Row(
                          children:<Widget> [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Поиск...",
                                  hintStyle: TextStyle(color:kPrimaryColor.withOpacity(0.5),fontSize: 18),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                ),

                              ),
                            ),
                            Icon(Iconsax.search_normal, size: 25,color:kPrimaryColor.withOpacity(0.5)),
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
            Container(
              height: 30,
              child: Stack(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 10,),
                    child: Text("Вход",
                    style: sub,),
                  ),
                  Positioned(
                    bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 7,
                        color: kPrimaryColor.withOpacity(0.15),
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),


      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:60.0),
        child: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){return DobovlenieInfor();})),
          //Get.to(Dobovlenie()),
          tooltip: 'Добавление',
          child: Icon(Icons.add),
        ),
      ),

    );
  }
}
