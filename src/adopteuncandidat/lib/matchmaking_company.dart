import 'package:adopteuncandidat/layout/common_layout.dart';
import 'package:adopteuncandidat/matchmaking_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CompanyMatchmakingScreen extends StatefulWidget {
  final CompanyMatchmakingModel model;

  const CompanyMatchmakingScreen({super.key, required this.model});

  @override
  State<CompanyMatchmakingScreen> createState() => _CompanyMatchmakingScreenState();
}

class _CompanyMatchmakingScreenState extends State<CompanyMatchmakingScreen> {
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
                image: widget.model.backgroundUrl != null
                    ? DecorationImage(
                        image: NetworkImage(widget.model.backgroundUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
                color: widget.model.backgroundColor,
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
                        child: Image.network(widget.model.logoUrl),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.model.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          // TODO: Have colors be passed in the model
                          color: Colors.yellow,
                          backgroundColor: Color.fromARGB(255, 2, 61, 4),
                        ),
                      ),
                      Text(
                        widget.model.location,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 45),
                      ...[
                        for (final softskill in widget.model.softskills)
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
