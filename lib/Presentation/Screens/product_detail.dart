import 'package:flutter/material.dart';
import 'package:plant_care/models/product_model.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.asset(
                product.imageUrl,
                scale: 9,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF100E0E),
                      fontSize: 23,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
