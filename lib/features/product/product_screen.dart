import 'package:flutter/material.dart';

class ProdcutScreen extends StatelessWidget {
  const ProdcutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "images/spectacles.png",
                    ),
                  ),
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
                        const SizedBox(
                          height: 10,
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
              // Center(
              //   child: Image.asset(
              //     "images/spectacles.png",
              //   ),
              // ),
              const Spacer(),
              const Text(
                'Eyevy',
                textScaleFactor: 1.5,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Full Rim Round, Cat-eyed Anti Glare Frame (48mm)',
                textScaleFactor: 1.5,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 10, backgroundColor: Colors.white),
                          onPressed: () {},
                          child: const Text('ADD TO CART',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black))),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 10, backgroundColor: Colors.orange),
                          onPressed: () {},
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
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
