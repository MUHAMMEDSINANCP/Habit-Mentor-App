import 'package:flutter/material.dart';

import '../services.dart/charts_builder.dart';

class Habitspage extends StatefulWidget {
  const Habitspage({Key? key}) : super(key: key);

  @override
  State<Habitspage> createState() => _HabitspageState();
}

class _HabitspageState extends State<Habitspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(children: [
                Image.asset('assets/HabitsPageBackground.png'),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 140, 0, 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(children: [
                      Text(
                        "Your Habits",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Use this to be inspired",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ]),
                  ),
                )
              ]),
            ),
          ),
          SizedBox(
            height: 513,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 200,
                  child: LineChartSample1(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 200,
                  child: LineChartSample2(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 200,
                  child: LineChartSample3(),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
