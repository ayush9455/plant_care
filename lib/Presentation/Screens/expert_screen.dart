import 'package:flutter/material.dart';
import 'package:plant_care/Presentation/screens/community_screen.dart';
import 'package:plant_care/Presentation/widgets/plant_expert_card.dart';

class ExpertsScreen extends StatelessWidget {
  const ExpertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Plant Care',
            style: TextStyle(fontWeight: FontWeight.bold, shadows: [
              Shadow(color: Colors.grey, blurRadius: 4, offset: Offset(1, 1))
            ])),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 90),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color.fromARGB(255, 37, 170, 70),
              Color.fromARGB(0, 11, 138, 143)
            ],
          ),
        ),
        child: ListView(padding: EdgeInsets.zero, children: [
          PlantExpertCard(
              name: 'Durgesh Chaturvedi',
              expertise: 'Agronomist',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(),
                  ))),
          PlantExpertCard(
              name: 'Dr. SK Singh',
              expertise: 'Phd Agriculture',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(),
                  ))),
          PlantExpertCard(
              name: 'Dr. Ram Lakhan',
              expertise: 'Phd* Agriculture , Agronomist',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(),
                  ))),
        ]),
      ),
    );
  }
}
