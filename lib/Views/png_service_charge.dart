import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../utills/launch_mobile.dart';

class PngServiceChange extends StatefulWidget {
  const PngServiceChange({Key? key}) : super(key: key);

  @override
  State<PngServiceChange> createState() => _PngServiceChangeState();
}

class _PngServiceChangeState extends State<PngServiceChange> {

  List<Item>? _items;

  int _selectedIndex=0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _items = _generateItems();
    });
  }
  List<Item> _generateItems() {
    return List.generate(20, (int index) {
      return Item(
        id: index,
        name: 'Item $index',
        description: 'Details of item $index',
      );
    });
  }
  ExpansionPanel _buildExpansionPanel(Item item) {
    return ExpansionPanel(
      isExpanded: item.isExpanded!,
      canTapOnHeader: true,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          child: ListTile(
            title: Text(item.name!),
            subtitle: Text(item.name!),
          ),
        );
      },
      body: ListTile(
        title: Text(item.description!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text("PNG SERVICE CHARGE"),
      ),
      body: SingleChildScrollView(
        child:ExpansionPanelList(
          animationDuration: const Duration(seconds: 2),
          expandedHeaderPadding: EdgeInsets.all(10),
          dividerColor: Colors.grey,
          elevation: 4,
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _items![index].isExpanded = !isExpanded;
            });
          },
          children: _items!.map((item) => _buildExpansionPanel(item)).toList(),
        ),
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
      }
      else if (_selectedIndex == 1) {
        showBottomSheet(context: context,  builder: (builder) {
          return LaunchMobilePage();
        });
      }

    });
  }
}



class Item {
  Item({
    this.id,
    this.name,
    this.description,
    this.isExpanded = false,
  });

  int? id;
  String? name;
  String? description;
  bool? isExpanded;
}