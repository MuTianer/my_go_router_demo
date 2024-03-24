import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/common/widgets/x_route_module_page.dart';
import 'package:my_go_router_transition_demo/routes/route_config.dart';

class XPage3 extends StatelessWidget {
  const XPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return XRouteModulePage(
      pageIndex: 3,
      targetPageName: YRouteNames.y1,
      bodyBg: Colors.blue,
      closeOnPressed: () => context.goNamed(
        RouteNames.top,
      ),
      targetOnPress: () => context.goNamed(
        YRouteNames.y1,
      ),
    );
  }
}
