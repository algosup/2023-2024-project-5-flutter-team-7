import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MatchmakingDoneScreen extends StatefulWidget {
  const MatchmakingDoneScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MatchmakingDoneScreenState createState() => _MatchmakingDoneScreenState();
}

class _MatchmakingDoneScreenState extends State<MatchmakingDoneScreen> {
  void _onReturnPressed() {
    context.go('/matchmaking');
    print('Return button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children: [
            // Background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/enseignemc.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.5), // Change the opacity as needed
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
                        child: Image.asset("assets/logomc.png"),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'McDonald',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                          backgroundColor: Color.fromARGB(255, 2, 61, 4),
                        ),
                      ),
                      const Text(
                        'Châteauroux',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'It\'s a match!',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'L\'entreprise\nvous contactera\n prochainement',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      )
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
                onTap: _onReturnPressed,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 4, 103, 183),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
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
