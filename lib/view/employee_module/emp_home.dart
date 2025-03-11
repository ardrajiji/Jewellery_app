import 'package:flutter/material.dart';
import 'package:jewellery_app/view/employee_module/emp_booking_history.dart';
import 'package:jewellery_app/view/employee_module/emp_home_screen.dart';
import 'package:jewellery_app/view/employee_module/emp_profile/page/emp_profile.dart';


class EmployeeHomePage extends StatefulWidget {
  const EmployeeHomePage({super.key});

  @override
  _EmployeeHomePageState createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          
          UserRequestPage(),
          const EmpBookingHistory(),
          const UserProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 111, 5, 109),
        unselectedItemColor: Colors.grey,
        enableFeedback: false,
        selectedFontSize: 13,
        iconSize: 20,
        showSelectedLabels: true,
      ),
    );
  }
}


