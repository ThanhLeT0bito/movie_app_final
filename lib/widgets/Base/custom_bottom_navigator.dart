import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:movie_app_final/screens/home_watching_screen.dart';
import '../../resources/app_color.dart';
import '../../screens/home_order_movie_screen.dart';

class CustomBottomNavigator extends StatefulWidget {
  final String ticketLabel;
  final String movieLabel;
  final IconData? iconTicket;
  final IconData? iconVideo;
  final IconData? iconTicketSelected;
  final IconData? iconVideoSelected;

  const CustomBottomNavigator({
    Key? key,
    required this.ticketLabel,
    required this.movieLabel,
    required this.iconTicket,
    required this.iconVideo,
    required this.iconTicketSelected,
    required this.iconVideoSelected,
  }) : super(key: key);

  @override
  _CustomBottomNavigatorState createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeWatching(),
    HomeOrderMovie(),
    HomeOrderMovie(),
  ];

  @override
  Widget build(BuildContext context) {
    final List<IconData> _selectedIcons = [
      Iconsax.home_15,
      widget.iconTicketSelected ??
          Iconsax
              .ticket5, // Sử dụng biểu tượng mặc định nếu không được cung cấp
      widget.iconVideoSelected ??
          Iconsax.video, // Sử dụng biểu tượng mặc định nếu không được cung cấp
      Icons.person,
    ];

    final List<IconData> _unselectedIcons = [
      Iconsax.home,
      widget.iconTicket ??
          Iconsax.ticket, // Sử dụng biểu tượng mặc định nếu không được cung cấp
      widget.iconVideo ??
          Iconsax.video1, // Sử dụng biểu tượng mặc định nếu không được cung cấp
      Iconsax.user,
    ];

    return Container(
      height: 70,
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 0 ? _selectedIcons[0] : _unselectedIcons[0]),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 1 ? _selectedIcons[1] : _unselectedIcons[1]),
            label: widget.ticketLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 2 ? _selectedIcons[2] : _unselectedIcons[2]),
            label: widget.movieLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 3 ? _selectedIcons[3] : _unselectedIcons[3]),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            // Điều hướng đến trang tương ứng
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => _widgetOptions[index],
            ));
          });
        },
      ),
    );
  }
}
