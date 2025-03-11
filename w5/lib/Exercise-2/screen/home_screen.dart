import 'package:flutter/material.dart';
import '../model/color_counter.dart';
import 'package:provider/provider.dart';

enum CardType { red, blue }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  ///
  /// We use countModel to call it use automatic
  ///
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (BuildContext context, CounterModel value, Widget? child) {
        // Test console Ex2
        print("Color Count");
        return Scaffold(
          body: _currentIndex == 0 ? ColorTapsScreen() : StatisticsScreen(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.tap_and_play),
                label: 'Taps',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Statistics',
              ),
            ],
          ),
        );
      },
    );
  }
}

class ColorTapsScreen extends StatefulWidget {
  const ColorTapsScreen({super.key});
  @override
  ColorTapsScreenState createState() => ColorTapsScreenState();
}

class ColorTapsScreenState extends State<ColorTapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [ColorTap(type: CardType.red), ColorTap(type: CardType.blue)],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;

  const ColorTap({super.key, required this.type});

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (context, count, child) {
        // Check condition
        final countTap =
            type == CardType.red ? count.redCount : count.blueCount;

        return GestureDetector(
          // On tap to increment the value
          onTap: () {
            if (type == CardType.red) {
              count.incrementRed();
            } else {
              count.incrementBlue();
            }
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(
                'Taps: $countTap',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Consumer<CounterModel>(
        builder: (context, count, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Red Taps: ${count.redCount}',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Blue Taps: ${count.blueCount}',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
