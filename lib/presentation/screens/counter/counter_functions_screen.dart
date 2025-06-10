import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Counter Functions'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              clickCounter == 1 ? 'Click' : 'Clicks',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh_rounded,
            tooltip: 'Reiniciar contador',
            onPressed: () {
              clickCounter = 0;
              setState(() {});
            },
          ),

          SizedBox(height: 20),

          CustomButton(
            icon: Icons.plus_one,
            tooltip: 'Incrementar contador',
            onPressed: () {
              clickCounter++;
              setState(() {});
            },
          ),

          SizedBox(height: 20),

          CustomButton(
            icon: Icons.exposure_minus_1,
            tooltip: 'Restar contador',
            onPressed: () {
              if (clickCounter == 0) return;
              clickCounter--;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData? icon;
  final String? tooltip;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }
}
