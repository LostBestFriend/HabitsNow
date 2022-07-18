import 'package:flutter/material.dart';
import '../widgets/customBottomBar.dart';
import 'sidebar/navigation_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body:  const CustomBottomBar(),
      drawer: const NavigationDrawer(),
    );
  }
}
