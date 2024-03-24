import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/common/widgets/x_route_module_page.dart';
import 'package:my_go_router_transition_demo/routes/route_config.dart';

class XPage2 extends StatelessWidget {
  const XPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return XRouteModulePage(
      pageIndex: 2,
      targetPageName: XRouteNames.x3,
      bodyBg: Colors.green,
      closeOnPressed: () {
        context.goNamed(
          RouteNames.top,
        );
      },
      targetOnPress: () => context.goNamed(
        XRouteNames.x3,
      ),
    );
  }
}
