import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/presenter/ui/habits/state/provider/habits_provider.dart';
import 'app/presenter/ui/sidebar/widgets/navigation_provider.dart';
import 'app/presenter/ui/task/provider/task_provider.dart';
import 'core/colors.dart';
import 'shared/widgets/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
        ),
        ChangeNotifierProvider<TaskProvider>(
          create: (context) => TaskProvider(),
        ),
        ChangeNotifierProvider<HabitsProvider>(
          create: (context) => HabitsProvider(),
        ),
      ],
      child: MaterialApp(
        color: titleColor,
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: "Main Page",
        home: const SplashPage(),
      ),
    ),
  );
}
