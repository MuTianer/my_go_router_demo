import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_go_router_transition_demo/routes/route_config.dart';
import 'package:my_go_router_transition_demo/common/style/text_style.dart';
import 'package:my_go_router_transition_demo/routes/z_route_config.dart';
import 'package:riverpod/riverpod.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: const Text('TopPage'),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    'Top Page',
                    style: bodyText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => context.goNamed(XRouteNames.x1),
                    child: const Text(
                      'go to X module x1',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => context.goNamed(ZRouteNames.z1),
                    child: const Text(
                      'go to Z module z1',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
