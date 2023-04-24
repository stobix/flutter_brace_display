import 'package:flutter/material.dart';

import 'package:brace_display/brace_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget text(String s) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(s),
      );
  Widget h1(String s) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(s, textScaleFactor: 2),
      );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: text('Brace display example app'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                h1("With header"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BraceDisplay(
                            head: text("Good"),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text('Cows are good'),
                                text('So are chickens'),
                                text('And pigs'),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BraceDisplay(
                      head: text("Bad"),
                      direction: BraceDirection.right,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          text('Eating too much is bad'),
                          text('So is eating too little'),
                          text('And dying'),
                        ],
                      )),
                ),
                h1("from both sides"),
                IntrinsicWidth(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BraceDisplay(
                      head: text("Good"),
                      direction: BraceDirection.right,
                      child: BraceDisplay(
                          head: text("Good"),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              text('Cows are good'),
                              text('So are chickens'),
                              text('And pigs'),
                            ],
                          ))),
                )),
                h1("Without header"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BraceDisplay(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text('Cows are good'),
                      text('So are chickens'),
                      text('And pigs'),
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BraceDisplay(
                    direction: BraceDirection.right,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text('Eating too much is bad'),
                        text('So is eating too little'),
                        text('And dying'),
                      ],
                    ),
                  ),
                ),
                h1("Different header pos"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BraceDisplay(
                      head: text("Good"),
                      headPos: 0.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text('Cows are good'),
                          text('So are chickens'),
                          text('And pigs'),
                        ],
                      )),
                ),
                SizedBox(
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BraceDisplay(
                        head: text("Bad"),
                        headPos: 0.7,
                        direction: BraceDirection.right,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            text('Eating too much is bad'),
                            text('So is eating too little'),
                            text('And dying'),
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
