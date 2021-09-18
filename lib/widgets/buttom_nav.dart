import 'package:flutter/material.dart';

import '../theme.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;
  List<IconData> data = [
    Icons.home,
    Icons.email,
    Icons.payment,
    Icons.favorite,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(23),
        color: Color(0xffF6F7F8),
        child: Container(
          height: 65,
          width: MediaQuery.of(context).size.width - (2 * edge),
          child: ListView.builder(
            itemCount: data.length,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (ctx, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  width: 35,
                  decoration: BoxDecoration(
                    border: i == selectedIndex
                        ? Border(
                            bottom: BorderSide(
                              width: 3.0,
                              color: purpleColor,
                            ),
                          )
                        : null,
                    gradient: i == selectedIndex
                        ? LinearGradient(
                            colors: [Colors.purple.shade50, Color(0xffF6F7F8)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)
                        : null,
                  ),
                  child: Icon(
                    data[i],
                    size: 26,
                    color:
                        i == selectedIndex ? purpleColor : Colors.grey.shade800,
                  ),
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
