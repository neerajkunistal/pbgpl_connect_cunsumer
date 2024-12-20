import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utills/launch_mobile.dart';

class FAQList extends StatefulWidget {
  @override
  _FAQListState createState() => new _FAQListState();
}

class _FAQListState extends State<FAQList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Text(
                "FAQ",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Colors.lightBlueAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
              ),
              label: "Dial Before Dig"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: "Ask Maitri",
          )
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 0) {
        showModalBottomSheet(
            context: context,
            builder: (builder) {
              return new Container(
                  height: 350.0,
                  color: Colors.transparent,
                  //could change this to Color(0xFF737373),
                  //so you don't have to change MaterialApp canvasColor
                  child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Text(
                                  'Customer Care',
                                  textAlign: TextAlign.right,
                                  style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  )),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                      AssetImage("assets/icons/user.png"),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  launch("tel:1800102509");
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 20.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 50,
                                      color: Colors.black12,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            color: Colors.red,
                                            width: 70,
                                            height: 70,
                                            child: Icon(Icons.phone,
                                                color: Colors.white),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text('1800-102-5109',
                                                    style: TextStyle(
                                                        color: Colors.grey))
                                              ],
                                            ),
                                          ),
                                          /*       Icon(Icons.arrow_forward_ios,
                                              color: Colors.blue),*/
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  launch("tel:1800-180-5109");
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 20.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 50,
                                      color: Colors.black12,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            color: Colors.red,
                                            width: 70,
                                            height: 70,
                                            child: Icon(Icons.phone,
                                                color: Colors.white),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text('1800-180-5109',
                                                    style: TextStyle(
                                                        color: Colors.grey))
                                              ],
                                            ),
                                          ),
                                          /*       Icon(Icons.arrow_forward_ios,
                                              color: Colors.blue),*/
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ));
            });
      } else if (_selectedIndex == 1) {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => DialBeforeDig()));
      } else if (_selectedIndex == 2) {
        showBottomSheet(
            context: context,
            builder: (builder) {
              return LaunchMobilePage();
            });
      } else if (_selectedIndex == 3) {
        print('The value of the input is: third');
      }
    });
  }
}
