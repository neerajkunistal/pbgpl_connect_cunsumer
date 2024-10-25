import 'package:flutter/material.dart';
import '../utills/launch_mobile.dart';


class PNGPrice extends StatefulWidget {
  @override
  _PNGPriceState createState() => _PNGPriceState();
}
class _PNGPriceState extends State<PNGPrice> {

   var superherosLength;
  int selectedIndex = 0;
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.lightBlueAccent,
        title: Text("PNG Price List"),
      ),
      body: ListView.builder(
        itemCount: superherosLength == null ? 0 : superherosLength.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
           children: [
             Card(
               child: ListTile(
                 title: Text("GAS PRICE"),
                 subtitle: Text("Rs. 20.6 per scm"),
               ),
             ),
             Card(
               child: ListTile(
                 title: Text("Lat Fee"),
                 subtitle: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("2 %"),
                     Text("2.4 %"),
                     Text("3 %"),
                   ],
                 ),
               ),
             ),

           ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Colors.lightBlueAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.account_box,), label: "Dial Before Dig"),
          BottomNavigationBarItem(icon: Icon(Icons.chat,), label: "Ask Maitri",)
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        Navigator.of(context).pop();
      }  else if (selectedIndex == 1) {
        showBottomSheet(
            context: context, builder: (builder) {
              return LaunchMobilePage();
            });
      }
    });
  }
}