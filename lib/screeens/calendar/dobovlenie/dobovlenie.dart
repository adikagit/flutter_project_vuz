import 'dart:ui';

import 'package:adivuz/const.dart';
import 'package:adivuz/screeens/calendar/calendar.dart';
import 'package:adivuz/screeens/calendar/dobovlenie/buttons.dart';
import 'package:adivuz/screeens/calendar/dobovlenie/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Dobovlenie extends StatefulWidget {
  const Dobovlenie({Key? key}) : super(key: key);
  @override
  _DobovlenieState createState() => _DobovlenieState();
}

class _DobovlenieState extends State<Dobovlenie> {

  final TextEditingController _nameDisController = TextEditingController();
  final TextEditingController _prepodovatelController = TextEditingController();
  final TextEditingController _kabinetController = TextEditingController();

  var _name;
  var _surname;
  var _man;

  // ValueChanged<String> callback

  String ? _active;
  String _endTime="9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _select="Лк.";
  List<String>list=["Лк.","Пр.","Лб.",];
  int _selectedColor=0;

  void active(String btn) {
    setState(() => _active = btn);
  }

  void initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState(){
    super.initState();

    initFirebase();// Add code after super

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: boxColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: boxColor,
        leading: GestureDetector(
          onTap:() => Navigator.of(context).pop(),
              //Get.back(),
          child: Icon(Icons.arrow_back_ios, size: 25,color:Colors.grey),
        ),
      ),

      body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (String value){
                          _name = value;
                        },
                      ),
                      Text("Добавление", style: sub1,),
                      SizedBox(height: 8,),
                      MyInputFiled(title: "Название дисциплины", hint: "Введите...",controller: _nameDisController),
                      SizedBox(height: 8,),
                      MyInputFiled(title: "Преподаватель", hint: "Введите...",controller: _prepodovatelController,vvv: _surname,),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Expanded(
                            child: MyInputFiled(title: "Кабинет", hint: "Введите...",controller: _kabinetController,),
                          ),
                          SizedBox(width: 12,),
                          Expanded(
                            child: MyInputFiled(title: "Вид", hint: "$_select",
                            widget: DropdownButton(
                              icon: Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey[650],),
                              iconSize: 32,
                              elevation: 4,
                              style: sub3,
                              underline: Container(height: 0,),
                              onChanged: (String ? newValue){
                                setState(() {
                                  _select = newValue!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>((String? value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value!,style: TextStyle(color:Colors.black54),),
                                );
                              }).toList(),
                            ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Expanded(
                            child: MyInputFiled(
                              title: "Начало",
                              hint: _startTime,
                              widget: IconButton(
                                onPressed: (){
                                  _getTimeFromUser(isStartTime: true);
                                },
                                icon: Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.grey[650],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Expanded(
                            child: MyInputFiled(
                              title: "Конец",
                              hint: _endTime,
                              widget: IconButton(
                                onPressed: (){
                                  _getTimeFromUser(isStartTime: false);
                                },
                                icon: Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.grey[650],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 5, right:5,top: 18),
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <ButtonsCalen>[
                          ButtonsCalen(
                            action: active, //pass data from child to parent
                            tag: "button1", //specifies attribute of button
                            active: _active == "button1" ? true : false,
                            buttonName: 'Mode',
                            textName: "Пн",
                          ),
                          ButtonsCalen(
                            action: active,
                            tag: "button2",
                            active: _active == "button2" ? true : false,
                            buttonName: 'Sounds',
                            textName: "Вт",
                          ),
                          ButtonsCalen(
                            action: active,
                            tag: "button3",
                            active: _active == "button3" ? true : false,
                            buttonName: 'Volume',
                            textName: "Ср",
                          ),
                          ButtonsCalen(
                            action: active,
                            tag: "button4",
                            active: _active == "button4" ? true : false,
                            buttonName: 'Volume',
                            textName: "Чт",
                          ),
                          ButtonsCalen(
                            action: active,
                            tag: "button5",
                            active: _active == "button5" ? true : false,
                            buttonName: 'Volume',
                            textName: "Пт",
                          ),
                          ButtonsCalen(
                            action: active,
                            tag: "button6",
                            active: _active == "button6" ? true : false,
                            buttonName: 'Volume',
                            textName: "Сб",
                          ),
                        ],
                      ),
                    )),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Цвет",
                            style:sub2,),
                          SizedBox(height: 8.0,),
                          Wrap(
                              children: List<Widget>.generate(
                                  4,
                                      (int index){
                                    return GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          _selectedColor=index;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: index==0?greennn:index==1?blueee:index==2?yellowww:reddd,
                                          child: _selectedColor==index?Icon(Icons.done,
                                            color:Colors.white,
                                            size: 20,):Container(),
                                        ),
                                      ),
                                    );
                                  }
                              )
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 18),
                        child: ElevatedButton(
                          onPressed: () {
                            FirebaseFirestore.instance.collection('pn').add({'name': _name});
                          }, child: Text("Добавить"),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }

  _validateDate(){
    if(_nameDisController.text.isNotEmpty&&_prepodovatelController.text.isNotEmpty&&_kabinetController.text.isNotEmpty){
      FirebaseFirestore.instance.collection('pn').add({'name': _name});
      // Navigator.pop(context, MaterialPageRoute(builder: (context){return Calendar();}));
    }else if (_nameDisController.text.isEmpty||_prepodovatelController.text.isEmpty||_kabinetController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.only(left: 15,right: 15),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.error_outline,size: 32,color: Colors.white,),
              SizedBox(width: 16,),
              Expanded(
                child: Text(
                  "Введите поля",
                  style: TextStyle(fontSize: 19),
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

  _getTimeFromUser({required bool isStartTime}) async {
      var pickedTime = await _showTimePicker();
      String _formatedTime = pickedTime.format(context);
      if(pickedTime==null){
        print("fsdvs");
    }else if(isStartTime==true){
        setState(() {
          _startTime=_formatedTime;
        });
    }else if(isStartTime==true){
        setState(() {
          _endTime=_formatedTime;
        });
    }
  }
  _showTimePicker(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context:context,
      initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      )
    );
  }
}

