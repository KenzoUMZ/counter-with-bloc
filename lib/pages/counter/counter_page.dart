import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../utils/responsive.dart';
import 'cubit/counter_cubit.dart';
import 'cubit/counter_state.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPage();
}

class _CounterPage extends State<CounterPage> {
  late CounterCubit _cubit;

  @override
  void initState() {
    _cubit = CounterCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            BlocBuilder<CounterCubit, CounterState>(
              bloc: _cubit,
              builder: (context, state) {
                return Text(
                  state.counter.toString(),
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                );
              },
            ),
            const Gap(20),
            Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Responsive.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () {
                    _cubit.addCounter(7);
                  },
                  child: const Text(
                    '7',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Gap(20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () {
                    _cubit.addCounter(8);
                  },
                  child: const Text(
                    '8',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
