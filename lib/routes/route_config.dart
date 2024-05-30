import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/page/top_page.dart';
import 'package:my_go_router_transition_demo/routes/x_route_config.dart';
import 'package:my_go_router_transition_demo/routes/z_route_config.dart';

// ルート名を定義するクラス
class RouteNames {
  static const String top = 'top'; // トップページのルート名
}

// ルート名を定義するクラス
class XRouteNames {
  static const String x1 = 'x1'; // ステップ1のルート名
  static const String x2 = 'x2'; // ステップ2のルート名
  static const String x3 = 'x3'; // ステップ3のルート名

  /// ここで独立したサブルートを定義します。独立したサブルートは複数存在し、相互にネストすることもできます。
  static const List<String> stepRoutesModule = [x1, x2, x3];
}

// ルート名を定義するクラス
class YRouteNames {
  static const String y1 = 'y1'; // ステップ1のルート名
  static const String y2 = 'y2'; // ステップ2のルート名
  static const String y3 = 'y3'; // ステップ3のルート名

  /// ここで独立したサブルートを定義します。独立したサブルートは複数存在し、相互にネストすることもできます。
  static const List<String> stepRoutesModule = [y1, y2, y3];
}

/// ルーティングの構成
final GoRouter goRouterConfig = GoRouter(
  initialLocation: '/',
  // デバッグログを出力するかどうか
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: RouteNames.top,
      builder: (context, state) => const TopPage(),
      routes: [
        ...xRouteConfig,
        ...zRouteConfig
      ],
    ),
  ],
);
