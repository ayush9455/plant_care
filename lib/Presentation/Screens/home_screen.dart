import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plant_care/Presentation/screens/upload_screen.dart';
import 'package:plant_care/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: false,
        title: Text(
            'Hi ${AuthService.user?.displayName?.split(' ')[0] ?? 'User'}!',
            style: TextStyle(fontWeight: FontWeight.bold, shadows: [
              Shadow(color: Colors.grey, blurRadius: 4, offset: Offset(1, 1))
            ])),
        actions: [
          GestureDetector(
            child: Icon(Icons.logout_rounded),
            onTap: () => AuthService.logout(),
          )
        ],
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
        child: GridView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: const [
            PlantItem(
              imageUrl: 'lib/assets/images/appleimage.jpg',
              name: 'Apple',
            ),
            // PlantItem(
            //   imageUrl:
            //       'https://firebasestorage.googleapis.com/v0/b/shopapp-dc723.appspot.com/o/strawberry.png?alt=media&token=fa262da9-1d6b-4e3c-b2b7-cc47cb7b63b3',
            //   name: 'Strawberry',
            // ),
            PlantItem(
              imageUrl: 'lib/assets/images/potato.jpg',
              name: 'Potato',
            ),
            // PlantItem(
            //   imageUrl:
            //       'lib/assets/images/tomato.png',
            //   name: 'Tomato',
            // ),
            PlantItem(
              imageUrl: 'lib/assets/images/corn.png',
              name: 'Corn',
            ),
            PlantItem(
              imageUrl: 'lib/assets/images/grapes.png',
              name: 'Grapes',
            ),
            // PlantItem(
            //   imageUrl:
            //       'https://firebasestorage.googleapis.com/v0/b/shopapp-dc723.appspot.com/o/peach.png?alt=media&token=300fbacb-15c0-4dcf-a298-ffd0b4686c3e',
            //   name: 'Peach',
            // ),
            // PlantItem(
            //   imageUrl:
            //       'https://firebasestorage.googleapis.com/v0/b/shopapp-dc723.appspot.com/o/cherry.png?alt=media&token=9edfa825-e07d-4dbc-846e-3a6ddb70453d',
            //   name: 'Cherry',
            // ),
            // PlantItem(
            //   imageUrl:
            //       'https://firebasestorage.googleapis.com/v0/b/shopapp-dc723.appspot.com/o/pepper.png?alt=media&token=561b8b83-6291-4606-a0f7-f408ba7d4e1a',
            //   name: 'Pepper',
            // ),
            // PlantItem(
            //   imageUrl: '',
            //   name: 'Unknown',
            // ),
          ],
        ),
      ),
    );
  }
}

class PlantItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  const PlantItem({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UploadScreen(title: name),
      )),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(2),
        child: Card(
          surfaceTintColor: Colors.white,
          child: Column(
            children: [
              const Spacer(),
              if (imageUrl != '')
                Image.asset(
                  imageUrl,
                  scale: 5,
                  fit: BoxFit.cover,
                ),
              // Image.network(
              //   imageUrl,
              //   scale: 5,
              //   fit: BoxFit.cover,
              // ),
              if (imageUrl == '')
                Image.asset(
                  'lib/assets/images/potato_leaf.png',
                  scale: 4,
                  fit: BoxFit.cover,
                ),
              const Spacer(),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF100E0E),
                  fontSize: 22,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
