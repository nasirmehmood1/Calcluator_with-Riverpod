import 'package:flutter/material.dart';
import 'package:flutter_calcluator_riverpod/provider/provider.dart';
import 'package:flutter_calcluator_riverpod/widgets/button_row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Consumer(
              builder: (context, ref, child) {
                final value = ref.watch(calcluatorProvider);
                return Container(
                  height: height * 0.35,
                  width: width,
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.bottomRight,
                  child: Column(children: [
                    SizedBox(
                      height: height * 0.12,
                    ),
                    Text(
                      value.equation,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Text(
                      value.result,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                );
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Row(
              children: [
                ButtonRow(first: 'AC', second: 'del', third: '%', fourth: '/'),
              ],
            ),
            const Row(
              children: [
                ButtonRow(first: '7', second: '8', third: '9', fourth: 'X'),
              ],
            ),
            const Row(
              children: [
                ButtonRow(first: '4', second: '5', third: '6', fourth: '-')
              ],
            ),
            const Row(
              children: [
                ButtonRow(first: '1', second: '2', third: '3', fourth: '+')
              ],
            ),
            const Row(
              children: [
                ButtonRow(first: '0', second: '00', third: '.', fourth: '=')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
