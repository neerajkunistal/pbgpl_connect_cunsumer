import 'package:flutter/material.dart';

class MenuData {
  MenuData(this.icon, this.title);

  final IconData icon;
  final String title;
}

final List<MenuData> menu = [
  MenuData(Icons.pending, 'Bill Request'),
  MenuData(Icons.bookmark, 'Self Billing'),
  MenuData(Icons.payment, 'My Payments'),
  MenuData(Icons.approval, 'Bill Approved Request'),
  MenuData(Icons.comment_rounded, 'Complaints'),
  MenuData(Icons.history, 'Complaint History'),
];
