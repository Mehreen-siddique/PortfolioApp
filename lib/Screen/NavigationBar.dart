import 'package:flutter/material.dart';
import 'package:portfolioapp/Screen/ProjectScreen.dart';
import 'package:portfolioapp/Screen/SkillsScreen.dart';
import 'package:portfolioapp/Screen/contactScreen.dart';
import 'package:portfolioapp/Screen/profileScreen.dart';

class Navigationbar extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const Navigationbar({super.key, required this.onToggleTheme});

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}


class _NavigationbarState extends State<Navigationbar> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
      body: TabBarView(
          children:[
          HomeScreen(onToggleTheme: widget.onToggleTheme),
            Projectscreen(),
            Skillsscreen(),
            Contactscreen(),
        ]
      ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: theme.bottomNavigationBarTheme.backgroundColor ??
                theme.scaffoldBackgroundColor,
            border: Border(
              top: BorderSide(
                color: theme.dividerColor,
                width: 0.3,
              ),
            ),

          ),
      child: TabBar(
        indicatorColor: theme.bottomNavigationBarTheme.selectedItemColor ??
            theme.secondaryHeaderColor,
        indicatorWeight: 2.5,
        labelColor: theme.bottomNavigationBarTheme.selectedItemColor ??
            theme.primaryColor,
        unselectedLabelColor:
        theme.bottomNavigationBarTheme.unselectedItemColor ??
            theme.unselectedWidgetColor,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.only(bottom: 73),

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
