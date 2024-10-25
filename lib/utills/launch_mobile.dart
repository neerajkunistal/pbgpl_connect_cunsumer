import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchMobilePage extends StatelessWidget {
  const LaunchMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        color: Colors.transparent,
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
                      child: Text('Emergency',
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
                      child: Icon( Icons.close,color:Colors.black, ),
                    )
                  ],
                ),  ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 35),
                    GestureDetector(
                      onTap: () {
                        launch("tel:1800111817");
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
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
                                  child: Icon(Icons.phone,color: Colors.white),
                                ),
                                SizedBox(height: 20,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('1800-111-817',style: TextStyle(color: Colors.grey))
                                    ],
                                  ),
                                ),
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
        )
    );
  }
}
