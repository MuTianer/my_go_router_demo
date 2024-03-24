import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/common/widgets/z_route_module_page.dart';
import 'package:my_go_router_transition_demo/routes/route_config.dart';
import 'package:my_go_router_transition_demo/routes/z_route_config.dart';

class ZPage1 extends StatelessWidget {
  const ZPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return ZRouteModulePage(
      pageIndex: 1,
      targetPageName: ZRouteNames.z2,
      bodyBg: Colors.teal,
      closeOnPressed: () => context.goNamed(
        RouteNames.top,
      ),
      targetOnPress: () => context.goNamed(
        ZRouteNames.z2,
      ),
    );
  }
}
