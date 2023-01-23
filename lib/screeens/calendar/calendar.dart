import 'package:adivuz/screeens/calendar/dobovlenie/dobovlenie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';
//import 'package:get/get.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key,}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 7);
    super.initState();
  }

  Widget _pageView(int index) {
    return ListView.builder(
      itemExtent: 100,//размер
      itemCount: 10,//количество
      itemBuilder: (context, i) => Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text('Tab ${index + 1} - item no $i')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorfulTabBar(
              indicatorHeight: 2,
              verticalTabPadding: 4.5,
              labelStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              selectedHeight: 53,
              unselectedHeight: 43,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white30,
              //selectedHeight: 64,
              //unselectedHeight: 48,
              tabs: [
                TabItem(
                    title: Text('Пн'),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade400),
                TabItem(
                    title: Text('Вт'),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade400),
                TabItem(
                    title: Text('Ср'),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade400),
                TabItem(
                    title: Text('Чт'),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade400),
                TabItem(
                    title: Text('Пт'),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade400),
                TabItem(
                    title: Text('Сб'),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade400),
                TabItem(
                    title: Text('Вс'),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade400),
              ],
              controller: _tabController,
            ),
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: List.generate(7, (index) => _pageView(index))),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:60.0),
        child: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){return Dobovlenie();})),
              //Get.to(Dobovlenie()),
          tooltip: 'Добавление',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}