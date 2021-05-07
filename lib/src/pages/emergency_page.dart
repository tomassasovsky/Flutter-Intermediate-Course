import 'package:animate_do/animate_do.dart';
import 'package:designs/src/widgets/headers.dart';
import 'package:designs/src/widgets/slide_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String title;
  final List<Color> colors;

  ItemBoton(this.icon, this.title, this.colors);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', [Color(0xff6989F5), Color(0xff906EF5)]),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', [Color(0xff66A9F2), Color(0xff536CF6)]),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', [Color(0xffF2D572), Color(0xffE06AA3)]),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', [Color(0xff317183), Color(0xff46997D)]),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', [Color(0xff6989F5), Color(0xff906EF5)]),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', [Color(0xff66A9F2), Color(0xff536CF6)]),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', [Color(0xffF2D572), Color(0xffE06AA3)]),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', [Color(0xff317183), Color(0xff46997D)]),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', [Color(0xff6989F5), Color(0xff906EF5)]),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', [Color(0xff66A9F2), Color(0xff536CF6)]),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', [Color(0xffF2D572), Color(0xffE06AA3)]),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', [Color(0xff317183), Color(0xff46997D)]),
    ];
    final itemMap = items
        .map(
          (item) => FadeInLeft(
            child: SlideButton(title: item.title, icon: item.icon, colors: item.colors),
            duration: Duration(milliseconds: 250),
          ),
        )
        .toList();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: 80),
                ...itemMap,
              ],
            ),
          ),
          PageHeader(),
        ],
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          subtitle: 'Has solicitado',
          title: 'Asistencia Médica',
        ),
        Positioned(
          child: RawMaterialButton(
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white),
            shape: CircleBorder(),
            padding: EdgeInsets.all(15),
            onPressed: () {},
          ),
          right: -15,
          top: 35,
        ),
      ],
    );
  }
}

// class ButtonTemp extends StatelessWidget {
//   const ButtonTemp({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SlideButton(
//       icon: FontAwesomeIcons.carCrash,
//       title: 'Motor Accident',
//       onTap: () {
//         print('SDASDSADA');
//       },
//     );
//   }
// }

