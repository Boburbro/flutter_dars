import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './logic/counter/counter_cubit.dart';

import '/logic/counter/counter_state.dart';
// ignore: unused_import
import './persentation/screens/other_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CounterCubit(),
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocListener<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state is CounterError) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text(state.message),
                      ),
                    );
                  }
                },
                child: BlocBuilder<CounterCubit, CounterState>(
                  builder: (ctx, state) {
                    if (state is CounterLoading) {
                      return const CircularProgressIndicator();
                    }
                    return Text(
                      "${state.number}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              )

              /*
              // int - State
              BlocConsumer<CounterCubit, int>(
                builder: (context, state) {
                    return Text(
                      "${BlocProvider.of<CounterCubit>(context, listen: true).state}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                listener: (context, state) {
                  if (state == 3) {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return const AlertDialog(
                          content: Text("AJOYIB"),
                        );
                      },
                    );
                  }
                  if (state == 5) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const OtherScreen(),
                      ),
                    );
                  }
                },
              
              )
            */
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: context.read<CounterCubit>().increment,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: context.read<CounterCubit>().decrement,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
