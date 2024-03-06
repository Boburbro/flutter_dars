import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/counter/counter_bloc.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("BLOC"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocListener<CounterBloc, CounterState>(
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
              child: BlocBuilder<CounterBloc, CounterState>(
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
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(CounterIncrementEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(CounterDecrementEvent()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
