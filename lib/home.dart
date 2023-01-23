import 'package:adivuz/const.dart';
import 'package:adivuz/screeens/calendar/calendar.dart';
import 'package:adivuz/screeens/communication.dart';
import 'package:adivuz/screeens/information/information.dart';
import 'package:adivuz/screeens/location/location.dart';
import 'package:adivuz/screeens/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int selindex = 0;

  final screens = [
    Calendar(),
    Location(),
    Information(),
    Communication(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {

    final items = <Widget>[
      Icon(Icons.calendar_today_outlined, size: 30,),
      Icon(Iconsax.search_normal, size: 30,),
      Icon(Icons.account_balance_outlined, size: 30,),
      Icon(Icons.article_outlined, size: 30,),
      Icon(Iconsax.user, size: 30,),
    ];

    return Container(
      color:  glColor,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(

            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: true,
            extendBody: true,
            backgroundColor: boxColor,
            body: screens[selindex],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(color: Colors.white)
              ),
              child: CurvedNavigationBar(
                color: glColor,
                buttonBackgroundColor: glColor,
                backgroundColor: Colors.transparent,
                animationCurve: Curves.easeInOut, //easeInBack
                animationDuration: Duration(milliseconds: 300),
                height: 60,
                index: selindex,
                items: items,
                onTap: (index){
                  setState(() {
                    selindex=index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}



