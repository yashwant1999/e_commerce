import 'package:flutter/material.dart';

class ProdcutScreen extends StatelessWidget {
  const ProdcutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset("images/spectacles.png"),
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const CircleBorder()),
                          onPressed: () {},
                          child: const Icon(
                            Icons.heart_broken,
                            color: Colors.grey,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const CircleBorder()),
                          onPressed: () {},
                          child: const Icon(
                            Icons.backup_sharp,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              const Text('Eyevy'),
              const Text('Full Rim ROund..'),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {},
                        child: const Text('ADD TO CART')),
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {},
                        child: const Text('Buy Now')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
