import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../presenter/home/home_page.dart';

class CustomTopBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomTopBar({
    Key? key,
    required this.title,
    this.simbol = const Text(""),
  }) : super(key: key);

  final String title;
  final Widget simbol;

  @override
  State<CustomTopBar> createState() => _CustomTopBarState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}

class _CustomTopBarState extends State<CustomTopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: iconActivePage),
      backgroundColor: backgroundPage,
      title: Text(widget.title),
      actions: [
        Row(
          children: [
            widget.simbol,
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.more_vert,
                color: iconDisablePage,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
