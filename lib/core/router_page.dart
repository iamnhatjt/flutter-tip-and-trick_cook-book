import 'package:flutter/material.dart';
import 'package:flutter_cookbook/app_apge.dart';

import '../flutter_navigation/deep_link_navigation.dart';

Map<String, WidgetBuilder> appRouterConFig = {
  PathRoute.intitRoute: (context) => AppPage(),
  PathRoute.simpleRoute: (context) => SecondDeepLinkWidget(),
};

class PathRoute {
  static const intitRoute = '/';
  static const simpleRoute = '/simple_route';
}
