import 'package:designs/src/theme/theme.dart';
import 'package:designs/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CircularGraphicsPage extends StatefulWidget {
  @override
  _CircularGraphicsPageState createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percentage += 10;
            if (percentage > 100) {
              percentage = 0;
            }
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(percentage: percentage, color: Colors.blue),
                CustomRadialProgress(percentage: percentage * 1.2, color: Colors.red),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(percentage: percentage * 1.4, color: Colors.pink),
                CustomRadialProgress(percentage: percentage * 1.6, color: Colors.purple),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    Key? key,
    required this.percentage,
    required this.color,
  }) : super(key: key);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      height: MediaQuery.of(context).size.width / 2 - 20,
      width: MediaQuery.of(context).size.width / 2 - 20,
      child: RadialProgress(
        percentage: percentage,
        primaryColor: this.color,
        secondaryColor: theme.textTheme.bodyText2!.color!,
      ),
    );
  }
}
