import 'package:adivuz/const.dart';
import 'package:adivuz/screeens/calendar/dobovlenie/const.dart';
import 'package:adivuz/screeens/information/dobovlenie/dobovlenieInfor.dart';
import 'package:adivuz/screeens/information/widget/buttonS.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final Stream<QuerySnapshot> infoSream =
  FirebaseFirestore.instance.collection('info').snapshots();
  String? imageLink;
  @override
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: boxColor2,
      body: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: screenHeight/3,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    title: Text("adivuz"),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ),
                ),

                Positioned(
                  top: screenWidth*1.09,
                  height: screenHeight*0.435,
                  left: 8,
                  right: 8,
                  child: Container(
                    child: StreamBuilder(
                      stream: infoSream,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if(snapshot.hasError){return Text("Ошибка");}
                        //else if(!snapshot.hasData){return Center(child: Text("Нет записей",style: TextStyle(fontSize: 20),));}
                        else if(snapshot.connectionState == ConnectionState.waiting){return Center(child: CircularProgressIndicator(),);}
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            // color: Colors.blue,
                          ),
                          child: ListView(
                            children: snapshot.data!.docs.map((info){
                              return GestureDetector(
                                onTap:(){},
                                child: Column(
                                  children: [
                                    SizedBox(height: 20,),
                                    Padding(padding: EdgeInsets.only(left: 3,right: 3,),
                                      child: ListTile(
                                        tileColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          side:BorderSide(
                                              color: Colors.black54
                                          ),
                                        ),
                                        title: Text(
                                          info['tit1'],
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        subtitle: Text(
                                          info['tit2'],
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        // trailing: Text(DateFormat('hh:mm a').format(message.time.toDate())),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),

                          ),
                        );
                      },

                    ),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(0),
                    //   color: Colors.red,
                    // ),
                  ),
                ),

                Positioned(
                    left: 0,
                    right: 0,
                    top: screenWidth*0.45,
                    height: screenHeight*0.32,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight*0.1,),
                          Text("KGTU",
                            style: sub1,
                          ),
                          Text("университет",
                            style: sub3,
                          ),
                          SizedBox(height: 30),
                          ButtonsInfo(),
                        ],
                      ),
                    )
                ),

                Positioned(
                  top: screenHeight*0.102,
                  left: (screenWidth-150)/2,
                  right: (screenWidth-150)/2,
                  child: Container(
                    child:Column(
                      children: <Widget>[
                        imageLink != null ?
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.network(imageLink!),
                          ),
                          radius: 100,
                        ):
                        CircleAvatar(
                          child: ClipOval(
                            child: Icon(Icons.account_balance_outlined, size: 80,),
                          ),
                          radius: 100,
                        ),
                      ],
                    )
                  )
                ),

              ],
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
