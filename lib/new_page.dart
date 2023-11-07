import 'package:flutter/material.dart';

class New_Page extends StatefulWidget {
  const New_Page({super.key});

  @override
  State<New_Page> createState() => _New_PageState();
}

class _New_PageState extends State<New_Page> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("New Page"),),
    );
  }
}
