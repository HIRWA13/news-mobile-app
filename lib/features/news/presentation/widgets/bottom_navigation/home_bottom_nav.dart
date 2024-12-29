import 'package:flutter/material.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({
    super.key,
  });

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

List<IconData> _homeNavIcons = [
  Icons.home_outlined,
  Icons.bookmark_border_outlined,
  Icons.search,
  Icons.notifications_none_outlined,
  Icons.settings_outlined,
];

int selectedIndex = 0;

class _HomeBottomNavState extends State<HomeBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 24,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 20,
              spreadRadius: 10,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _homeNavIcons.map((icon) {
            final int index = _homeNavIcons.indexOf(icon);
            final bool isSelected = selectedIndex == index;
            return Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        top: 15,
                        bottom: 0,
                        left: 15,
                        right: 15,
                      ),
                      child: Icon(
                        icon,
                        color: isSelected ? Colors.black : Colors.grey,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ));
  }
}
