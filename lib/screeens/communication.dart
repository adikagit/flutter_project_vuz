import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';

class Communication extends StatefulWidget {
  Communication({Key? key,}) : super(key: key);

  @override
  _CommunicationState createState() => _CommunicationState();
}

class _CommunicationState extends State<Communication>{
  final Stream<QuerySnapshot> _infoSream =
  FirebaseFirestore.instance.collection('info').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
      ),
      body: StreamBuilder(
        stream: _infoSream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasError){return Text("Ошибка");}
          //if(!snapshot.hasData){return Text("Нет записей");}
          if(snapshot.connectionState == ConnectionState.waiting){return Center(child: CircularProgressIndicator(),);}
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // color: Colors.blue,
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index){
                return GestureDetector(
                  onTap:(){},
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Padding(padding: EdgeInsets.only(left: 3,right: 3,),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side:BorderSide(
                                color: Colors.black
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docChanges[index].doc['tit1'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data!.docChanges[index].doc['tit2'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );

        },

      ),
    );
  }
}

