import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plant_care/presentation/widgets/product_item.dart';

import '../../fake_db.dart';
import '../widgets/plant_expert_card.dart';
import 'community_screen.dart';

class ResultScreen extends StatelessWidget {
  final File imageFile;
  final String disease;
  const ResultScreen({Key? key, required this.imageFile, required this.disease})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(disease);
    Map<String, List<int>> prescription = {
      'Cercospora_leaf_spot Gray_leaf_spot': [9, 10],
      'Common_rust': [7, 8],
      'Northern_Leaf_Blight': [11, 12],
      'Apple___Apple_scab': [1, 2],
      'Apple___Black_rot': [3, 4],
      'Apple___Cedar_apple_rust': [5, 6],
      'Apple___healthy': [],
      'Grape_Black_rot': [0],
      'Grape_Esca_(Black_Measles)': [17],
      'Grape_Leaf_blight_(Isariopsis_Leaf_Spot)': [18],
      'Grape_healthy': [],
      'Potato early blight': [13, 14],
      'Potato late blight': [15, 16],
    };

    bool isdiseaseFound = !disease.toLowerCase().contains('healthy');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title:
            const Text('Result', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 90),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [
                Color.fromARGB(255, 4, 132, 36),
                Color.fromARGB(0, 11, 138, 143)
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 350,
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    imageFile,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: !isdiseaseFound
                      ? const Text(
                          'No Disease Found !',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        )
                      : const Text(
                          'Disease Found !',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (isdiseaseFound)
                SizedBox(
                  width: 350,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'RESULT',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Expected Disease : $disease',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              if (isdiseaseFound)
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Recommended Products',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            GridView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              children: prescription[disease] == null
                                  ? []
                                  : prescription[disease.trim()]!
                                      .map((e) => ProductItem(
                                          name: FakeDb.medicines[e].name,
                                          imageUrl:
                                              FakeDb.medicines[e].imageUrl,
                                          id: FakeDb.medicines[e].id))
                                      .toList(),
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // const Text(
                            //   "- Sulfur in dust form can keep disease at bay. Be sure to apply while wearing a mask so the dust doesn’t irritate your eyes and mouth. .",
                            //   style: TextStyle(
                            //       color: Colors.black,
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: 18),
                            // ),
                          ],
                        ),
                      ),
                    )),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Ask Experts',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              children: [
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
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // const Text(
                          //   "- Sulfur in dust form can keep disease at bay. Be sure to apply while wearing a mask so the dust doesn’t irritate your eyes and mouth. .",
                          //   style: TextStyle(
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.w400,
                          //       fontSize: 18),
                          // ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
