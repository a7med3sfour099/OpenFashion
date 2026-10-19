import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/widgets/custom_appbar_widget.dart';
import 'package:openfashion/widgets/svg_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppbar(isBlack: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Gap(25),
                /// Head
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgIcon(
                      'assets/texts/10.svg',
                      Colors.grey.withOpacity(0.5),
                      180,
                    ),
                    Positioned(
                      top: 120,
                      left: 30,
                      right: 0,
                      child: SvgIcon(
                        'assets/texts/Collection.svg',
                        Colors.white,
                        15,
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 50,
                      right: 0,
                      // bottom: 0,
                      child: SvgIcon(
                        'assets/texts/October.svg',
                        Colors.white,
                        42,
                      ),
                    ),
                    Positioned(
                      top: 150,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/cover/cover1.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 420,
                      left: 140,
                      child: SvgIcon(
                        'assets/texts/10.svg',
                        Colors.black.withOpacity(0.5),
                        245,
                      ),
                    ),
                  ],
                ),
                Gap(550),
                Center(
                  child: Text(
                    'Home Screen',
                    style: Theme.of(context).textTheme.headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Gap(20),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(
                          'assets/cover/cover1.png',
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Gap(10),
                        Text(
                          'Item ${index + 1}',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    );
                  },
                ),

                Gap(600),
                Text(
                  'End of Home Screen',
                  style: Theme.of(context).textTheme.headlineMedium
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
