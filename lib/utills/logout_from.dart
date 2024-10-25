import 'package:flutter/material.dart';

class LogoutFromPage extends StatelessWidget {
  final VoidCallback? onPressed;
  const LogoutFromPage({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none, children: <Widget>[
        Positioned(
          right: -40.0,
          top: -40.0,
          child: InkResponse(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CircleAvatar(
              child: Icon(Icons.close),
              backgroundColor: Colors.red,
            ),
          ),
        ),
        Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Card(
                  elevation: 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("HPCL Connect",style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Text("Do you want logout ?",style:TextStyle(color: Colors.black)),
                SizedBox(height: 4,),
                TextButton(
                  style: TextButton.styleFrom(backgroundColor:Colors.blue,),
                  child: Text("OK", style:TextStyle(color: Colors.white),
                  ),
                  onPressed: onPressed,
                )
              ],
            ),
          ),
        ),
      ],
      ),
    );
  }
}
