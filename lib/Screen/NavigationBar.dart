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

class _NavigationbarState extends State<Navigationbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });

    _pages = [
      HomeScreen(onToggleTheme: widget.onToggleTheme),
      Projectscreen(),
      Skillsscreen(),
      Contactscreen(),
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final offsetAnimation = Tween<Offset>(
            begin: Offset(
                _tabController.previousIndex > _tabController.index ? -1 : 1,
                0),
            end: Offset.zero,
          ).animate(animation);

          return SlideTransition(position: offsetAnimation, child: child);
        },
        child: _pages[_selectedIndex],
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
          controller: _tabController,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: theme.bottomNavigationBarTheme.selectedItemColor ??
                  Colors.black,
              width: 3,
            ),
            insets: const EdgeInsets.only(bottom: 72),
          ),
          labelColor: theme.bottomNavigationBarTheme.selectedItemColor ??
              theme.primaryColor,
          unselectedLabelColor:
          theme.bottomNavigationBarTheme.unselectedItemColor ??
              theme.unselectedWidgetColor,
          tabs: const [
            Tab(icon: Icon(Icons.home_outlined), text: "Home"),
            Tab(icon: Icon(Icons.work_outline), text: "Projects"),
            Tab(icon: Icon(Icons.code_outlined), text: "Skills"),
            Tab(icon: Icon(Icons.contact_mail_outlined), text: "Contact"),
          ],
        ),
      ),
    );
  }
}
