import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpatrol/core/bloc/home%20screen/category%20tab/category_tab_bloc.dart';
import 'package:pawpatrol/features/home%20screen/component/home_screen_component.dart';

class HomeScreenContainer extends StatelessWidget {
  const HomeScreenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryTabBloc(),
        ),
      ],
      child: HomeScreenComponent());
  }
}