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

  @override
  Widget build(BuildContext context) {
    print("Home Widget Rebuilt"); // Debugging

    return Scaffold(
      appBar: AppBar(title: const Text("Color Tapper")),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          ColorTapsScreen(),
          StatisticsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.tap_and_play), label: 'Taps'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Statistics'),
        ],
      ),
    );
  }
}

// ✅ Keeps this widget alive across tab switches
class ColorTapsScreen extends StatefulWidget {
  const ColorTapsScreen({super.key});

  @override
  State<ColorTapsScreen> createState() => _ColorTapsScreenState();
}

class _ColorTapsScreenState extends State<ColorTapsScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("ColorTapsScreen Built Once"); // Debugging

    return const Column(
      children: [ColorTap(type: CardType.red), ColorTap(type: CardType.blue)],
    );
  }
}

// This widget should ONLY rebuild when the specific counter updates
class ColorTap extends StatelessWidget {
  final CardType type;
  const ColorTap({super.key, required this.type});

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    print(" ${type == CardType.red ? 'Red' : 'Blue'} Tap Widget Built Once");

    return Selector<CounterModel, int>(
      selector: (context, counterModel) => type == CardType.red ? counterModel.redCount : counterModel.blueCount,
      builder: (context, countTap, child) {
        print(" ${type == CardType.red ? 'Red' : 'Blue'} Counter Updated");

        return GestureDetector(
          onTap: () {
            if (type == CardType.red) {
              context.read<CounterModel>().incrementRed();
            } else {
              context.read<CounterModel>().incrementBlue();
            }
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(
                'Taps: $countTap',
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

//  StatisticsScreen active when switching tabs
class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("StatisticsScreen Built Once");

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Selector<CounterModel, int>(
            selector: (context, counterModel) => counterModel.redCount,
            builder: (context, redCount, child) {
              print("Red Count");
              return Text('Red Taps: $redCount', style: const TextStyle(fontSize: 24));
            },
          ),
          Selector<CounterModel, int>(
            selector: (context, counterModel) => counterModel.blueCount,
            builder: (context, blueCount, child) {
              print("Blue Count ");
              return Text('Blue Taps: $blueCount', style: const TextStyle(fontSize: 24));
            },
          ),
        ],
      ),
    );
  }
}
