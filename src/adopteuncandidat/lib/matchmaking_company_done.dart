import 'package:adopteuncandidat/layout/common_layout.dart';
import 'package:adopteuncandidat/matchmaking_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CompanyMatchmakingDoneScreen extends StatefulWidget {
  final CompanyMatchmakingModel model;

  const CompanyMatchmakingDoneScreen({super.key, required this.model});

  @override

 State<CompanyMatchmakingDoneScreen> createState() => _CompanyMatchmakingDoneScreenState();
}

class _CompanyMatchmakingDoneScreenState extends State<CompanyMatchmakingDoneScreen> {
  void _onReturnPressed() {
    context.go('/matchmaking');
    print('Return button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      body: GestureDetector(
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
