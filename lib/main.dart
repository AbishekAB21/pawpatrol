import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpatrol/core/bloc/bottom%20nav%20bar/bottom_nav_bloc.dart';
import 'package:pawpatrol/routes/app_routes.dart';
import 'package:pawpatrol/utils/theme/app_theme.dart';
import 'package:pawpatrol/utils/theme/theme_cubit.dart';
import 'package:pawpatrol/utils/theme/theme_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(),),
        BlocProvider(create: (context) => BottomNavBloc(),)
      ],
      
      child: BlocBuilder<ThemeCubit, AppThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,

            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,

            themeMode: themeMode == AppThemeMode.dark
                ? ThemeMode.dark
                : ThemeMode.light,
          );
        },
      ),
    );
  }
}


/* 
Only blocs that are used across multiple screens should be provided here. Otherwise, 
provide the bloc in the screen's container widget. 
*/