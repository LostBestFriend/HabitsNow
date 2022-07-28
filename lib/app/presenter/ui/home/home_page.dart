import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../calendar/calendar_page.dart';
import '../categories/category_page.dart';
import '../habits/habits_page.dart';
import '../habits/widgets/show_modal_button.dart';
import '../task/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Widget? calendar;

  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.checklist_sharp,
          size: 30,
        ),
        label: 'Hoje',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.emoji_events,
          size: 30,
        ),
        label: 'Hábitos',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.check_circle_outline,
          size: 30,
        ),
        label: 'Tarefas',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.widgets_outlined,
          size: 30,
        ),
        label: 'Categorias',
      ),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void callback(int index) {
    setState(
      () {
        bottomSelectedIndex = index;
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        calendar!,
        const HabitsPage(),
        const TaskPage(),
        const CategoryPage(),
      ],
    );
  }

  @override
  void initState() {
    calendar = CalendarPage(callback: callback);
    super.initState();
  }

  void pageChanged(int index) {
    setState(
      () {
        bottomSelectedIndex = index;
      },
    );
  }

  void bottomTapped(int index) {
    setState(
      () {
        bottomSelectedIndex = index;
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      floatingActionButton: const ShowModalButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: iconActiveColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: iconDisableColor,
        showUnselectedLabels: true,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}
