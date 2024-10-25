import 'package:customer_connect/utills/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:customer_connect/models/complain_history_model.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../service/api_server.dart';
import '../utills/launch_mobile.dart';
import 'dashboard.dart';


class ComplainHistory extends StatefulWidget {
  const ComplainHistory({Key? key}) : super(key: key);

  @override
  State<ComplainHistory> createState() => _ComplainHistoryState();
}

class _ComplainHistoryState extends State<ComplainHistory> {

  var count = 0;
  String schema = " ";
  String dmaId = " ";
  bool loading = false;
  List<Data> list = [];
  int _selectedIndex=0;

  ApiIntegration? apiIntegration;
  ComplainHistoryRequestModel? complainHistoryRequestModel;

  @override
  void initState() {
    apiIntegration = ApiIntegration();
    loadData();
    super.initState();
  }

  loadData() async{
    await getLocalData();
    fetchHistory();
  }
  getLocalData() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      schema = pref.getString(GlobalConstants.schema) ?? "";
      dmaId = pref.getString(GlobalConstants.dmaId) ?? "";
    });

  }

  Future fetchHistory() async {
    setState(() {
      loading = true;
    });
    complainHistoryRequestModel  = ComplainHistoryRequestModel(
      schema: schema,
      dmaId: dmaId,
    );
    var response = await apiIntegration!.apiComplaints(complainHistoryRequestModel!);
    setState(() {
      list = response!;
    });
    if (response.toString() != null) {
      setState(() {
        loading = false;
      });
      print("success");
    } else {
      setState(() {
        loading = false;
      });
      print("failed");
    }
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.lightBlueAccent,
            statusBarIconBrightness: Brightness.light));
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        centerTitle: true,
          title: new Text("Complaint History",style: TextStyle(fontSize: 16, color: Colors.white),),
         ),
      body:Padding(
          padding: const EdgeInsets.all(8.0),
          child:ListView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith((states) => Colors.black),
                    dataRowHeight: 50,
                    dividerThickness: 5,
                    columns: [
                      DataColumn(
                        label: Text(
                          "User Name",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Text(
                            "Complain No",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Text(
                            "Complain Date",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Text(
                            "Date Of Registration",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Text(
                            "Complaint Category",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Text(
                            "Complaint Sub Category",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Text(
                            "Complain Status",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        numeric: false,
                      ),
                    ],
                    rows:[]
                  //   list.map((user) =>DataRow(
                  //           /* selected: selectedEmployees.contains(user),
                  // onSelectChanged: (b) {
                  //   print("Onselect");
                  //   onSelectedRow(b, user);
                  // },*/
                  //             cells: [
                  //               DataCell(
                  //                 Center(
                  //                   child: Text(user.firstName.toUpperCase()+" "+
                  //                       user.firstName.toUpperCase() == null
                  //                       ? '-'
                  //                       : user.firstName.toUpperCase()+" "+
                  //                       user.firstName.toUpperCase() == null
                  //                       ? '-'
                  //                       : user.firstName.toUpperCase()+" "+
                  //                       user.firstName.toUpperCase()),
                  //                 ),
                  //               ),
                  //
                  //               DataCell(
                  //                   Center(
                  //                     child: Text(user.complainNo==null
                  //                         ? '-'
                  //                         : user.complainNo),
                  //                   )
                  //
                  //               ),
                  //               DataCell(
                  //                   Center(
                  //                     child: Text(user.dateOfComplaint==null
                  //                         ? '-'
                  //                         : user.dateOfComplaint),
                  //                   )
                  //
                  //               ),
                  //               DataCell(
                  //                   Text(user.dateOfRegistration==null
                  //                       ? '-'
                  //                       : user.dateOfRegistration)
                  //
                  //               ),
                  //               DataCell(
                  //                   Center(
                  //                     child: Text(user.complainCat==null
                  //                         ? '-'
                  //                         : user.complainCat),
                  //                   )
                  //
                  //               ),
                  //               DataCell(
                  //                   Center(
                  //                     child: Text(user.complainSubcat==null
                  //                         ? '-'
                  //                         : user.complainSubcat),
                  //                   )
                  //
                  //               ),
                  //               DataCell(
                  //                   Center(
                  //                     child: Text(user.complainStatus==null
                  //                         ? '-'
                  //                         : user.complainStatus),
                  //                   )
                  //
                  //               ),
                  //               /*   DataCell(
                  //           Text(user.description == null
                  //               ? '-'
                  //               : user.description)
                  //
                  //         ),*/
                  //
                  //
                  //             ]),
                  //   )
                  //       .toList(),
                  ),
                ),
              ),
            ],
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
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
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        EasyLoading.dismiss();
        Navigator.of(context).pop();
      }  else if (_selectedIndex == 1) {
        showBottomSheet(context: context, builder: (builder) {
          return LaunchMobilePage();
        });
      }
    });
  }
}
