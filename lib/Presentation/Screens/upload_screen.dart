import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tflite_v2/tflite_v2.dart';

class UploadScreen extends StatefulWidget {
  final String title;
  const UploadScreen({super.key, required this.title});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? imageFile;
  List _predictions = [];
  Future getImageGallery(BuildContext context) async {
    ImagePicker picker = ImagePicker();

    await picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        (context as Element).markNeedsBuild();
      }
    });
  }

  Future getImageCamera(BuildContext context) async {
    ImagePicker picker = ImagePicker();

    await picker.pickImage(source: ImageSource.camera).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        (context as Element).markNeedsBuild();
      }
    });
  }

  loadModel() async {
  try {
    await Tflite.loadModel(

      model: 'lib/assets/ml_models/grape.tflite',
      labels: 'lib/assets/labels/grapes-labels.txt',
    );


  } catch (e) {
    print('Error loading model: $e');
  }
}




detectImage(File imageFile) async {
  try {
    
    //  var appDir = await getTemporaryDirectory();
    // var imagePath = join(appDir.path, basename(imageFile.path));


    var prediction = await Tflite.runModelOnImage(
      
        path: imageFile.path,   // required
  imageMean: 0.0,   // defaults to 117.0
  imageStd: 255.0,  // defaults to 1.0
  numResults:1,    // defaults to 5
  threshold: 0.2,   // defaults to 0.1
  asynch: true
     
    );
    print('okk');
    print(prediction);
    setState(() {
      _predictions = prediction!;
    });
  } catch (e) {
    print('Error detecting image: $e');
  }
}



  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text('Upload ${widget.title} Image',
            style: const TextStyle(fontWeight: FontWeight.bold)),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageFile != null
                ? SizedBox(
                    height: 350,
                    width: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        imageFile!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Image.asset('lib/assets/images/upload.png'),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () => getImageCamera(context),
                child: const Text('Capture From Camera')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => getImageGallery(context),
                child: const Text('Choose From Gallery')),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                  Colors.lightBlueAccent,
                )),
                onPressed: imageFile == null
                    ? null
                    : () {
                      detectImage(imageFile!);
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => ResultScreen(
                      //         imageFile: imageFile!,
                      //       )));
                            } ,
                child: const Text(
                  'Detect Disease',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
