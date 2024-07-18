import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:pedometer_app/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  int currentPageIndex = 0;
  int _targetSteps = 2000;
  Color titletextcolor = Color(0xFF123874);
  Color subtitletextcolor = Color(0xFFa9c4e0);

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pedometer",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FaIcon(FontAwesomeIcons.ellipsisVertical),
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFf5f8ff),
                    borderRadius: BorderRadius.circular(10)),
                height: 350,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularPercentIndicator(
                      radius: 100.0,
                      animation: true,
                      animationDuration: 1000,
                      lineWidth: 10.0,
                      percent: calculatePercent(),
                      animateFromLastPercent: true,
                      backgroundWidth: 5.0,
                      linearGradient: LinearGradient(colors: [
                        lightColorScheme.secondary,
                        lightColorScheme.primary
                      ]),
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$_steps",
                            style: TextStyle(
                                fontSize: 40,
                                color: titletextcolor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'steps',
                            style: TextStyle(
                                fontSize: 20, color: subtitletextcolor),
                          ),
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.grey.shade300,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Distance",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: subtitletextcolor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  "0.02 ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: titletextcolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "km",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: subtitletextcolor),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Time",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: subtitletextcolor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  "06 ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: titletextcolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "hrs",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: subtitletextcolor),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Burned",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: subtitletextcolor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  "40.6 ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: titletextcolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "kcal",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: subtitletextcolor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFf5f8ff),
                    borderRadius: BorderRadius.circular(10)),
                height: 152,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your daily Schedule",
                                style: TextStyle(
                                    color: titletextcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              Text(
                                "Last 7 days",
                                style: TextStyle(
                                    color: subtitletextcolor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: titletextcolor,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "5/7",
                                style: TextStyle(
                                    color: lightColorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(
                                "Achieved",
                                style: TextStyle(
                                    color: lightColorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.check,
                                size: 20,
                                color: lightColorScheme.primary,
                              ),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  color: Color(0xFFf5f8ff),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: lightColorScheme.primary,
                                      width: 2),
                                ),
                              ),
                              Text(
                                "M",
                                style:
                                    TextStyle(color: lightColorScheme.primary),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.check,
                                size: 20,
                                color: lightColorScheme.primary,
                              ),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  color: Color(0xFFf5f8ff),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: lightColorScheme.primary,
                                      width: 2),
                                ),
                              ),
                              Text(
                                "T",
                                style:
                                    TextStyle(color: lightColorScheme.primary),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.cancel_outlined,
                                  size: 20, color: subtitletextcolor),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  color: Color(0xFFf5f8ff),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: subtitletextcolor, width: 2),
                                ),
                              ),
                              Text(
                                "W",
                                style: TextStyle(color: subtitletextcolor),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.check,
                                size: 20,
                                color: lightColorScheme.primary,
                              ),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  color: Color(0xFFf5f8ff),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: lightColorScheme.primary,
                                      width: 2),
                                ),
                              ),
                              Text(
                                "T",
                                style:
                                    TextStyle(color: lightColorScheme.primary),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.cancel_outlined,
                                size: 20,
                                color: subtitletextcolor,
                              ),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  color: Color(0xFFf5f8ff),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: subtitletextcolor, width: 2),
                                ),
                              ),
                              Text(
                                "F",
                                style: TextStyle(color: subtitletextcolor),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.check,
                                size: 20,
                                color: lightColorScheme.primary,
                              ),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  color: Color(0xFFf5f8ff),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: lightColorScheme.primary,
                                      width: 2),
                                ),
                              ),
                              Text(
                                "S",
                                style:
                                    TextStyle(color: lightColorScheme.primary),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.check,
                                size: 20,
                                color: lightColorScheme.primary,
                              ),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  color: Color(0xFFf5f8ff),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: lightColorScheme.primary,
                                      width: 2),
                                ),
                              ),
                              Text(
                                "S",
                                style:
                                    TextStyle(color: lightColorScheme.primary),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 72,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      lightColorScheme.secondary,
                      lightColorScheme.primary,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFFf5f8ff), width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/map.png'),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " GPS Tracking",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.directions_walk,
                                  size: 17,
                                  color: Colors.white,
                                ),
                                Text(
                                  " Walk ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  " | ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.directions_run,
                                  size: 17,
                                  color: Colors.white,
                                ),
                                Text(
                                  " Run ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  " | ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.personBiking,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                Text(
                                  " Ride ",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: navigationBarThemeData,
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Color(0xFFe4ebff),
          elevation: 0,
          backgroundColor: Colors.white,
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            NavigationDestination(
                icon: Icon(
                  Icons.home_filled,
                  color: subtitletextcolor,
                ),
                selectedIcon: Icon(
                  Icons.home_filled,
                  color: Color(0xFF537eef),
                ),
                label: "Home"),
            NavigationDestination(
              icon: Icon(
                Icons.track_changes,
                color: subtitletextcolor,
              ),
              selectedIcon: Icon(
                Icons.track_changes,
                color: Color(0xFF537eef),
              ),
              label: "Track",
            ),
            NavigationDestination(
                icon: Badge(
                  child: Icon(
                    Icons.bar_chart,
                    color: subtitletextcolor,
                  ),
                ),
                selectedIcon: Icon(
                  Icons.bar_chart,
                  color: Color(0xFF537eef),
                ),
                label: "Reports"),
            NavigationDestination(
                icon: Badge(
                  child: Icon(
                    Icons.settings,
                    color: subtitletextcolor,
                  ),
                  label: Text('2'),
                ),
                selectedIcon: Icon(
                  Icons.settings,
                  color: Color(0xFF537eef),
                ),
                label: "Settings"),
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

/*
Center(
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
*/
