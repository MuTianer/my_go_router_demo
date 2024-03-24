import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/common/widgets/route_module_page.dart';
import 'package:my_go_router_transition_demo/page/z_pages/z_page_1.dart';
import 'package:my_go_router_transition_demo/page/z_pages/z_page_2.dart';
import 'package:my_go_router_transition_demo/page/z_pages/z_page_3.dart';

// ルート名を定義するクラス
class ZRouteNames {
  static const String z1 = 'z1'; // ステップ1のルート名
  static const String z2 = 'z2'; // ステップ2のルート名
  static const String z3 = 'z3'; // ステップ3のルート名

  /// ここで独立したサブルートを定義します。独立したサブルートは複数存在し、相互にネストすることもできます。
  static const List<String> stepRoutesModule = [z1, z2, z3];
}

final zRouteConfig = <RouteBase>[
  GoRoute(
    path: ZRouteNames.z1,
    name: ZRouteNames.z1,
    pageBuilder: (context, state) => zRouteModulePage(
      context,
      fullscreenDialog: true,
      const ZPage1(),
    ),
    routes: [
      GoRoute(
        path: ZRouteNames.z2,
        name: ZRouteNames.z2,
        pageBuilder: (context, state) => zRouteModulePage(
          context,
          const ZPage2(),
        ),
        routes: [
          GoRoute(
            path: ZRouteNames.z3,
            name: ZRouteNames.z3,
            pageBuilder: (context, state) => zRouteModulePage(
              context,
              const ZPage3(),
            ),
          ),
        ],
      ),
    ],
  ),
];

RouteModulePage zRouteModulePage(
  BuildContext context,
  Widget child, {
  bool fullscreenDialog = false,
}) {
  return RouteModulePage(
    child: child,
    fullscreenDialog: fullscreenDialog,
    // 目標ルート名を取得して、
    // 現在の遷移アクションが現在の画面が含まれる独立したサブルートから退出したものかどうかを判断します。
    routeModuleExit: () {
      // 目標ルート名
      final lastRouteName = GoRouter.of(context)
              .routerDelegate
              .currentConfiguration
              .last
              .route
              .name ??
          '';
      return !ZRouteNames.stepRoutesModule.contains(lastRouteName);
    },
  );
}
