import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '';
  int _steps = 0;
  int _targetSteps = 100;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pedometer App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 100.0,
              animation: true,
              animationDuration: 1000,
              lineWidth: 20.0,
              percent: calculatePercent(),
              animateFromLastPercent: true,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Steps Taken',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "$_steps",
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.grey,
              progressColor: Colors.black,
            ),
            const Divider(
              height: 70,
              thickness: 0,
              color: Colors.white,
            ),
            const Text(
              'Pedestrian Status',
              style: TextStyle(fontSize: 30),
            ),
            Icon(
              _status == 'walking'
                  ? Icons.directions_walk
                  : _status == 'stopped'
                      ? Icons.accessibility_new
                      : Icons.error,
              size: 100,
            ),
            Text(
              _status,
              style: _status == 'walking' && _status == 'stopped'
                  ? const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                  : const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  void onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps;
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    setState(() {
      _status = 'Pedestrian Status not available';
    });
  }

  void onStepCountError(error) {
    setState(() {
      _steps = 0;
    });
  }

  double calculatePercent() {
    return (_steps / _targetSteps).clamp(0.0, 1.0);
  }
}
