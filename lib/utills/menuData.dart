import 'package:flutter/material.dart';

class MenuData {
  MenuData(this.icon, this.title);

  final IconData icon;
  final String title;
}

final List<MenuData> menu = [
/*  MenuData(Icons.bookmark, 'Self Billing'),
  MenuData(Icons.pending, 'Self Bill History'),*/
  MenuData(Icons.payment, 'Payments History'),
/*  MenuData(Icons.approval, 'Know Your Bill'),*/
  MenuData(Icons.comment_rounded, 'Complaints'),
  MenuData(Icons.history, 'Complaint History'),
];
