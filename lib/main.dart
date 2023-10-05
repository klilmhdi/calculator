import 'package:calculator/features/calculator/presentation/manager/cubit/num_calculate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/themes.dart';
import 'features/calculator/presentation/pages/calculator_screen.dart';
import 'features/theme/manage/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => NumCalculatorCubit())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: theme.isDark ? darkThemeData(context) : lightThemeData(context),
      home: BlocProvider(
        create: (_) => NumCalculatorCubit(),
        child: NumCalScreen(),
      ),
    );
  }
}
