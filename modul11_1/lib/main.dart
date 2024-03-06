import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modul11/persentation/screens/bloc_screen.dart';

import '/logic/bloc/counter/counter_bloc.dart';
import 'logic/cubit/counter/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => CounterCubit(),
        ),
        BlocProvider(
          create: (ctx) => CounterBloc(),
        )
      ],
      child: MaterialApp(
          title: "Flutter Demo",
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const BlocScreen()),
    );
  }
}
