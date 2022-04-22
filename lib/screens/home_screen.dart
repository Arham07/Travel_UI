import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/widgets/destination_carousel.dart';
import 'package:travel_ui/widgets/hotel_carousel.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIcon = 0;
  int currentBottomIcon = 1;
  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];
  final items = <Widget>[
    const Icon(
      Icons.search_rounded,
      size: 30.0,
    ),
    const Icon(
      Icons.home,
      size: 30.0,
    ),
    const Icon(
      Icons.account_box_outlined,
      size: 30.0,
    ),
  ];

  Widget buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIcon = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: selectedIcon == index
              ? Theme.of(context).cardColor
              : const Color(0xFFE7EBEE),
        ),
        child: Icon(
          icons[index],
          size: 25.0,
          color: selectedIcon == index
              ? Theme.of(context).primaryColor
              : const Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Scaffold(
          body: Container(
            color: Theme.of(context).cardColor,
            child: SafeArea(
              top: false,
              // screens[index],
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 120),
                    child: Text(
                      'What would you like to find ? ',
                      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildIcon(0),
                      buildIcon(1),
                      buildIcon(2),
                      buildIcon(3),
                      //icons.asMap().entries.map((e) => buildIcon(icons.length),).toList(),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const DestinationCarousel(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const HotelCarousel(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: const IconThemeData(color: Colors.black87)),
            child: CurvedNavigationBar(
              onTap: (index) {
                setState(() {
                  currentBottomIcon = index;
                });
              },
              //extendedbody=true if we use photo as bg
              color: Theme.of(context).cardColor,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              items: items,
              height: 50.0,
              index: currentBottomIcon,
            ),
          )),
    );
  }
}
/*title has been deprecated so use:
label: "",
then in place of SizedBox.shrink() use:
bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,*/