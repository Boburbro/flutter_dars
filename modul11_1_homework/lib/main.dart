import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/logic/counter/counter_cubit.dart';
import '/logic/counter/counter_state.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        home: const myWidget(),
      ),
    );
  }
}

// ignore: camel_case_types
class myWidget extends StatelessWidget {
  const myWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc demo"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            if (state is CounterLoading) {
              return const CircularProgressIndicator();
            }
            if (state is CounterError) {
              return Text(state.message);
            }

            

            return Text(
              state.number.toString(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: context.read<CounterCubit>().increase,
            child: const Icon(Icons.add_rounded),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: context.read<CounterCubit>().decrease,
            child: const Icon(Icons.remove_rounded),
          ),
        ],
      ),
    );
  }
}
