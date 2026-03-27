import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/test/cubit/counter/counter_cubit.dart';
import '../../../logic/test/cubit/counter/counter_state.dart';

class CubitCounter extends StatelessWidget {
  const CubitCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Cubit Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),

            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state is CounterLoading) {
                  return CircularProgressIndicator();
                }
                return Text(
                  '${state.number}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),

            // BlocConsumer<CounterCubit, int>(
            //   listener: (context, state) {
            //     if (state == 3) {
            //       showDialog(
            //         context: context,
            //         builder: (context) {
            //           return AlertDialog(title: Text("Ajoyib"));
            //         },
            //       );
            //     }
            //     if (state == 5) {
            //       WidgetsBinding.instance.addPostFrameCallback((_) {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => OtherScreen()),
            //         );
            //       });
            //     }
            //   },

            //   builder: (context, state) {
            //     return Text(
            //       '$state',
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // ),

            // BlocListener<CounterCubit, int>(
            //   listener: (context, state) {
            //     if (state == 3) {
            //       showDialog(
            //         context: context,
            //         builder: (context) {
            //           return AlertDialog(title: Text("Ajoyib"));
            //         },
            //       );
            //     }
            //     if (state == 5) {
            //       WidgetsBinding.instance.addPostFrameCallback((_) {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => OtherScreen()),
            //         );
            //       });
            //     }
            //   },
            //   child: BlocBuilder<CounterCubit, int>(
            //     builder: (context, state) {
            //       return Text(
            //         '$state',
            //         style: Theme.of(context).textTheme.headlineMedium,
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: BlocProvider.of<CounterCubit>(context).increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: BlocProvider.of<CounterCubit>(context).decrement,
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
