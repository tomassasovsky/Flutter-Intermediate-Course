import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:designs/src/pages/slideshow_page.dart';
import 'package:designs/src/pages/emergency_page.dart';
import 'package:designs/src/pages/animated_rectangle_page.dart';
import 'package:designs/src/pages/headers_page.dart';
import 'package:designs/src/pages/circular_graphics_page.dart';
import 'package:designs/src/pages/pinterest_page.dart';
import 'package:designs/src/pages/sliver_list_page.dart';

final List<_Route> routes = [
  _Route(FontAwesomeIcons.slideshare, 'SlideShow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Animated Rectangle', AnimatedRectanglePage()),
  _Route(FontAwesomeIcons.circleNotch, 'Circular Progress', CircularGraphicsPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
