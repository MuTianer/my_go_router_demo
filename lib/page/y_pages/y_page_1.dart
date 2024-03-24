import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/common/widgets/y_route_module_page.dart';
import 'package:my_go_router_transition_demo/routes/route_config.dart';

class YPage1 extends StatelessWidget {
  const YPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return YRouteModulePage(
      pageIndex: 1,
      targetPageName: YRouteNames.y2,
      bodyBg: Colors.yellow,
      closeOnPressed: () => context.goNamed(
        XRouteNames.x3,
      ),
      targetOnPress: () => context.goNamed(
        YRouteNames.y2,
      ),
    );
  }
}
