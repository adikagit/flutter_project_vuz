import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:adivuz/const.dart';
import 'package:adivuz/screeens/calendar/dobovlenie/const.dart';
import 'package:adivuz/screeens/information/widget/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

class DobovlenieInfor extends StatefulWidget {
  @override
  _DobovlenieInforState createState() => _DobovlenieInforState();
}

class _DobovlenieInforState extends State<DobovlenieInfor> {

  final Stream<QuerySnapshot> infoSream =
  FirebaseFirestore.instance.collection('info').snapshots();

  List todoList=[];

  final Stream<QuerySnapshot> _infoSream =
  FirebaseFirestore.instance.collection('info').snapshots();

  TextEditingController tit1 =TextEditingController();
  TextEditingController tit2 =TextEditingController();

  //String? fileName;
  File? _image;

  CollectionReference ref =FirebaseFirestore.instance.collection('info');



  Widget build(BuildContext context) {

    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;

    Future uploadImage(Builder context) async{
      String fileName = _image!.path;
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask;
      taskSnapshot.ref.getDownloadURL().then(
            (value) => print("Downe:$value"),
      );
    }

    Future pickImage()async{
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding: EdgeInsets.only(left: 15,right: 15),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.error_outline,size: 30,color: Colors.white,),
                SizedBox(width: 16,),
                Expanded(
                  child: Text(
                    "Ничего не выбрано!",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
            // shape: StadiumBorder(),
            duration: Duration(milliseconds: 1000),
            backgroundColor: Colors.red,
            //behavior: SnackBarBehavior.floating,
          ),
        );
      }
      setState(() {
        _image = File(pickedFile!.path);
      });
      String fileName = _image!.path;
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask;
      // taskSnapshot.ref.getDownloadURL().then(
      //       (value) => print("Downe:$value"),
      // );
    }

    return
      Scaffold(
      backgroundColor: boxColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: boxColor,
        title: Text("Добавление", style: sub1,),
        centerTitle: true,
        leading: GestureDetector(
          onTap:() => Navigator.of(context).pop(),
              //Get.back(),
          child: Icon(Icons.arrow_back_ios, size: 25,color:Colors.grey),
        ),
      ),

      body: Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                    Container(
                      //clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: EdgeInsets.only(
                        left: (screenWidth-200)/2,
                        right: (screenWidth-200)/2,),
                        child:Column(
                          children: <Widget>[
                            _image != null ?
                            CircleAvatar(
                              child: ClipOval(
                                child: Image.file(_image!,fit: BoxFit.cover,),

                              ),
                              radius: 75,
                            ):
                            CircleAvatar(
                              child: ClipOval(
                                child: Icon(Icons.account_balance_outlined, size: 70,),
                              ),
                              radius: 75,
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: "btn1",
                                  foregroundColor: txtColor,
                                  backgroundColor: bxColor,
                                  onPressed: () {
                                    pickImage();

                                    // FirebaseStorage fs = FirebaseStorage.instance;
                                    // Reference rootReference = fs.ref();
                                    // Reference pictureFolderRef = rootReference.child("pictures").child("image");
                                    // pictureFolderRef.putFile(_image!).then((storageTask)async{
                                    //   String link = await storageTask.ref.getDownloadURL();
                                    //   print("vot");
                                    //   setState(() {
                                    //     imageLink = link;
                                    //   });
                                    // });
                                  },
                                  child: Icon(Iconsax.gallery, size: 30,),
                                ),
                                SizedBox(width: 20),
                                FloatingActionButton(
                                  heroTag: "btn2",
                                  foregroundColor: txtColor,
                                  backgroundColor: bxColor,
                                  onPressed: (){},
                                  child: Icon(Icons.camera_alt_outlined, size: 30,),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  SizedBox(height: 35,),
                  TextField(
                    controller:tit1,
                    // onChanged: (String value){
                    //   _name = value;
                    // },
                    style: TextStyle(

                        fontSize: 18
                    ),
                    decoration: InputDecoration(
                        labelText: 'Название обьявления',
                        labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black87
                        ),
                        hintText: 'Введите',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black45
                        ),
                        border: OutlineInputBorder()
                    ),
                    obscureText: false,
                    maxLength: 50,
                  ),
                   SizedBox(height: 20,),
                  TextField(
                    controller: tit2,
                    maxLines: 7,
                    cursorHeight: 20,
                    // onChanged: (String value){
                    //   _name = value;
                    // },
                    style: TextStyle(
                        fontSize: 18
                    ),decoration: InputDecoration(
                      labelText: 'Описание',
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black87
                      ),
                      hintText: 'Введите',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black45
                      ),
                      border: OutlineInputBorder()
                  ),

                    obscureText: false,
                    maxLength: 500,
                  ),
                  SizedBox(height: 8,),
                  Container(
                    padding: EdgeInsets.only(top: 18),
                    child: ElevatedButton(
                      onPressed: () {
                        _validateDate(context);
                      }, child: Text("Добавить"),),
                  ),

                  Divider(
                      color: Colors.black
                  ),
                  // Container(
                  //   child: StreamBuilder(
                  //     stream: infoSream,
                  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  //       if(snapshot.hasError){return Text("Ошибка");}
                  //       //else if(!snapshot.hasData){return Center(child: Text("Нет записей",style: TextStyle(fontSize: 20),));}
                  //       else if(snapshot.connectionState == ConnectionState.waiting){return Center(child: CircularProgressIndicator(),);}
                  //       return Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(12),
                  //           // color: Colors.blue,
                  //         ),
                  //         child: ListView(
                  //           children: snapshot.data!.docs.map((info){
                  //             return GestureDetector(
                  //               onTap:(){},
                  //               child: Column(
                  //                 children: [
                  //                   SizedBox(height: 20,),
                  //                   Padding(padding: EdgeInsets.only(left: 3,right: 3,),
                  //                     child: ListTile(
                  //                       tileColor: Colors.white,
                  //                       shape: RoundedRectangleBorder(
                  //                         borderRadius: BorderRadius.circular(10),
                  //                         side:BorderSide(
                  //                             color: Colors.black54
                  //                         ),
                  //                       ),
                  //                       title: Text(
                  //                         info['tit1'],
                  //                         style: TextStyle(
                  //                           fontSize: 20,
                  //                         ),
                  //                       ),
                  //                       subtitle: Text(
                  //                         info['tit2'],
                  //                         style: TextStyle(
                  //                           fontSize: 15,
                  //                         ),
                  //                       ),
                  //                       contentPadding: EdgeInsets.symmetric(
                  //                         vertical: 12,
                  //                         horizontal: 16,
                  //                       ),
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //             );
                  //           }).toList(),
                  //
                  //         ),
                  //       );
                  //
                  //     },
                  //
                  //   ),
                  //   // decoration: BoxDecoration(
                  //   //   borderRadius: BorderRadius.circular(0),
                  //   //   color: Colors.red,
                  //   // ),
                  // ),

                ],
              ),
            ),
          ),
          );
  }

  // uploadImage()async{
  //   final _storage = FirebaseStorage.instance;
  //   final _picer = ImagePicker();
  //   PickedFile? image;
  //
  //   //Check Permissions
  //   await Permission.photos.request();
  //   var permissionStatus = await Permission.photos.status;
  //   if (permissionStatus.isGranted){
  //     image = await _picer.getImage(source: ImageSource.gallery);
  //     final XFile file = XFile(image!.path);
  //     if(image != null){
  //       //Upload to Firebase
  //       var snapshot = await _storage.ref()
  //           .child('folderName/imageName')
  //           .putFile(file);
  //     }
  //   }
  // }
  _validateDate(BuildContext context){
    if(tit1.text.isNotEmpty && tit2.text.isNotEmpty){
      ref.add({
        "tit1":tit1.text,
        'tit2':tit2.text,
      });
      // Snackbar(text: "dcss", icon: Icons.check,);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding: EdgeInsets.only(left: 15,right: 15),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.check,size: 30,color: Colors.white,),
                SizedBox(width: 16,),
                Expanded(
                  child: Text(
                    "Добавлено",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
            duration: Duration(milliseconds: 800),
            backgroundColor: Colors.green,
            //behavior: SnackBarBehavior.floating,
          ),
      );
      }else if (tit1.text.isEmpty||tit2.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding: EdgeInsets.only(left: 15,right: 15),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.error_outline,size: 30,color: Colors.white,),
                SizedBox(width: 16,),
                Expanded(
                  child: Text(
                    "Введите все поля",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
            // shape: StadiumBorder(),
            duration: Duration(milliseconds: 1000),
            backgroundColor: Colors.red,
            //behavior: SnackBarBehavior.floating,
          )
      );
    }
  }
}

