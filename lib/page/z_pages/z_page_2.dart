import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/common/widgets/z_route_module_page.dart';
import 'package:my_go_router_transition_demo/routes/route_config.dart';
import 'package:my_go_router_transition_demo/routes/z_route_config.dart';

class ZPage2 extends StatelessWidget {
  const ZPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return ZRouteModulePage(
      pageIndex: 2,
      targetPageName: ZRouteNames.z3,
      bodyBg: Colors.pink,
      closeOnPressed: () => context.goNamed(
        RouteNames.top,
      ),
      targetOnPress: () => context.goNamed(
        ZRouteNames.z3,
      ),
    );
  }
}
