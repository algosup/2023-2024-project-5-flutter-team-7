import 'package:adopteuncandidat/layout/common_layout.dart';
import 'package:adopteuncandidat/models/matchmaking_model.dart';
import 'package:adopteuncandidat/mock_requests.dart';
import 'package:adopteuncandidat/providers/provider_matchmaking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CompanyMatchmakingScreen extends ConsumerStatefulWidget {
  final Uri? uri;

  const CompanyMatchmakingScreen({super.key, this.uri});

  @override
  ConsumerState<CompanyMatchmakingScreen> createState() =>
      _CompanyMatchmakingScreenState();
}

class _CompanyMatchmakingScreenState
    extends ConsumerState<CompanyMatchmakingScreen> {
  @override
  void initState() {
    _initCompany();
    super.initState();
  }

  Future<void> _initCompany() async {
    if (widget.uri == null) return;
    // dynamic json = await http.get(widget.uri); // TODO
    Map<String, dynamic> json = await getRandomCompany(); // TEMP
    final model = CompanyMatchmakingModel.fromJson(json);
    ref.read(matchmakingProvider.notifier).setCompany(model);
  }

  void _onCrossPressed() {
    context.go('/');
    print('Cross button pressed');
  }

  void _onTickPressed() {
    context.go('/matchmakingDone');
    print('Tick button pressed');
  }

  void _onSwipeLeft() {
    context.go('/matchmaking');
    print('Swiped left');
  }

  void _onSwipeRight() {
    context.go('/matchmakingDone');
    print('Swiped right');
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(matchmakingProvider).company;
    if (model == null) {
      return const CommonLayout(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return CommonLayout(
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! < 0) {
            _onSwipeLeft();
          } else if (details.primaryVelocity! > 0) {
            _onSwipeRight();
          }
        },
        child: Stack(
          children: [
            // Background image
            Container(
              decoration: BoxDecoration(
                image: model.backgroundUrl != null
                    ? DecorationImage(
                        image: NetworkImage(model.backgroundUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
                color: model.backgroundColor,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            Column(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 40),
                        width: 150,
                        child: Image.network(model.logoUrl),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        model.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          // TODO: Have colors be passed in the model
                          color: Colors.yellow,
                          backgroundColor: Color.fromARGB(255, 2, 61, 4),
                        ),
                      ),
                      Text(
                        model.location,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 45),
                      ...[
                        for (final softskill in model.softskills)
                          Text(
                            '\u2022 $softskill',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                      ]
                    ],
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              child: GestureDetector(
                onTap: _onCrossPressed,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: GestureDetector(
                onTap: _onTickPressed,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
