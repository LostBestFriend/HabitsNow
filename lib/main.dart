import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/habits/state/provider/habits_provider.dart';
import 'package:habits_now_app/presenter/task/provider/task_provider.dart';
import 'package:habits_now_app/presenter/task/task.dart';
import 'package:provider/provider.dart';

import 'core/colors.dart';
import 'presenter/sidebar/widgets/navigation_provider.dart';
import 'shared/widgets/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
          child: const TaskPage(),
        ),
        ChangeNotifierProvider<TaskProvider>(
          create: (context) => TaskProvider(),
        ),
        ChangeNotifierProvider<HabitsProvider>(
          create: (context) => HabitsProvider(),
        ),
      ],
      child: MaterialApp(
        color: AppColors.backgroundPage,
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: "Main Page",
        home: const SplashPage(),
      ),
    ),
  );
}
