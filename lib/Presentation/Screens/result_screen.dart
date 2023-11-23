
import 'dart:io';

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final File imageFile;
  final String disease;
  const ResultScreen({
    Key? key,
    required this.imageFile,
    required this.disease
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String,String> prescription ={
 'Cercospora_leaf_spot Gray_leaf_spot':'foliar fungicides',
 'Common_rust':'fungicides',
 'Northern_Leaf_Blight':'foliar fungicides,Crop rotation',
 'healthy':'NO PRESCEPTION',
 'Apple___Apple_scab':'Fungicides',
 'Apple___Black_rot':'Thiophanate-methyl',
 'Apple___Cedar_apple_rust':'Chlorothalonil',
 'Apple___healthy': 'No Prescription',
'Grape_Black_rot':'Bordeaux mixture',
'Grape_Esca_(Black_Measles)':'Captan 80WDG',
'Grape_Leaf_blight_(Isariopsis_Leaf_Spot)':'Dithane M-45',
'Grape_healthy':'NA',
'Tomato_Bacterial_spot' : 'BLITOX FUNGICIDE' ,
'Tomato_Early_blight':'Blitox Copper Oxychloride',
'Tomato_Late_blight':'Chlorothalonil',
'Tomato_Leaf_Mold':'Bordeaux Mixture',
'Tomato_Septoria_leaf_spot':'Dithane M-45',
'Tomato_Spider_mites_Two_spotted_spider_mite':'Neemix',
'Tomato_Target_Spot':'Bordeaux mixture',
'Tomato_Tomato_YellowLeaf_Curl_Virus':'ROGOR INSECTICIDE',
'Tomato_Tomato_mosaic_virus':'Neemix',
'Tomato_healthy':'NA',

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
      body: Container(
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
        child: SingleChildScrollView(
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
                  child: !isdiseaseFound?const Text(
                  'No Disease Found !',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ) :const Text(
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
              if(isdiseaseFound)
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
              if(isdiseaseFound)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'PRESCRIPTION',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                        prescription[disease]??'',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
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
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
