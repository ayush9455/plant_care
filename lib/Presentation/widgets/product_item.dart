import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  const ProductItem({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                SizedBox(
                  height: 80,
                  child: Image.asset(
                    'lib/assets/images/potato_leaf.png',
                    scale: 4,
                    fit: BoxFit.cover,
                  ),
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
