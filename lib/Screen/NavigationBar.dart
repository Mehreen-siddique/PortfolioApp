import 'package:flutter/material.dart';
import 'package:portfolioapp/Screen/ProjectScreen.dart';
import 'package:portfolioapp/Screen/profileScreen.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}


class _NavigationbarState extends State<Navigationbar> {

  int selectedIndex= 0;

  final List<Widget> screens = [
    HomeScreen(),
    // ProjectScreen(),
    // SkillScreen(),
    // ContactScreen(),
  ] ;

  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
      body: TabBarView(
          children:[
          HomeScreen(),
            Projectscreen(),
          // SkillScreen(),
          // ContactScreen(),
        ]
      ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.3,
              )
            )

          ),
      child: TabBar(
        indicatorColor: Colors.black,
        indicatorWeight: 2.5,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.only(bottom: 73),

        tabs: [
        Tab(icon: Icon(Icons.home_outlined), text: "Home"),
        Tab(icon: Icon(Icons.work_outline), text: "Projects"),
        Tab(icon: Icon(Icons.code_outlined), text: "Skills"),
        Tab(icon: Icon(Icons.contact_mail_outlined), text: "Contact"),
      ],
      )
        )
      )
      );
  }
}
