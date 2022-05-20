import 'package:covid_19_stats/objects/data_loader.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  SplashscreenState createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  Routing r = Routing();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => r.route(context));
  }

  @override
  Widget build(BuildContext context) {
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
