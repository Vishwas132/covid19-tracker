import 'package:covid_19_stats/objects/data_loader.dart';
import 'package:covid_19_stats/pages/home_page.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  SplashscreenState createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  Routing r = Routing();
  Map<dynamic, dynamic> apiResult = {};

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () => r.route(context))
        .then((result) => setState(() {
              apiResult = {
                "value": result["value"],
                "info": result["info"],
                "countries": result["countries"],
                "map": result["map"]
              };
            }));
  }

  @override
  Widget build(BuildContext context) {
    if (apiResult.isEmpty) {
      return buildSplashScreen(context);
    } else {
      return Worldwide(
        value: apiResult["value"],
        info: apiResult["info"],
        countries: apiResult["countries"],
        map: apiResult["map"],
      );
    }
  }

  SafeArea buildSplashScreen(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              image: const DecorationImage(
                image: AssetImage('images/image.jpg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
