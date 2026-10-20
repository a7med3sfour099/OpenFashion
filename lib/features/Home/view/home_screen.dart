import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:openfashion/features/Home/data/cover_model.dart';
import 'package:openfashion/features/Home/data/product_model.dart';
import 'package:openfashion/widgets/custom_appbar_widget.dart';
import 'package:openfashion/widgets/custom_text.dart';
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
              Gap(530),

              /// Products
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.67,
                ),
                itemCount: ProductModel.products.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Image.asset(
                              ProductModel.products[index].imageUrl,
                              width: 200,
                              height: 220,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Color(0xffDD8560),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(3),
                      CustomText(
                        text: ProductModel.products[index].name,
                        color: Colors.white,
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        text: ProductModel.products[index].description,
                        color: Colors.grey,
                        size: 14,
                      ),
                      CustomText(
                        text: '\$${ProductModel.products[index].price}',
                        color: Color(0xffDD8560),
                        size: 16,
                        weight: FontWeight.w400,
                      ),
                    ],
                  );
                },
              ),
              Gap(20),
              CustomText(
                text: 'You may also like'.toUpperCase(),
                color: Colors.white,
                size: 24,
                weight: FontWeight.w400,
              ),
              Gap(20),
              Image.asset('assets/svgs/line.png', width: 125),
              Gap(20),

              /// List of Covers
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: CoverModel.covers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              CoverModel.covers[index].imageUrl,
                              height: 350,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Gap(3),
                          CustomText(
                            text: CoverModel.covers[index].name,
                            color: Colors.white,
                            size: 16,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Gap(35),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Ionicons.logoTwitter,
                          color: Colors.white,
                          size: 30,
                        ),
                        Icon(
                          Ionicons.logoInstagram,
                          color: Colors.white,
                          size: 30,
                        ),

                        Icon(
                          Ionicons.logoFacebook,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                    Gap(25),
                    Image.asset('assets/svgs/line.png', width: 125),
                    Gap(25),
                    CustomText(
                      text: 'support@openui.design\n+60 825 876 \n08:00 - 22:00 - Everyday',
                      color: Colors.white,
                      size: 18,
                      weight: FontWeight.w400,
                      maxLines: 3,
                      height: 1.8,
                    ),
                    Gap(25),
                    Image.asset('assets/svgs/line.png', width: 125),
                    Gap(25),
                    CustomText(
                      text: 'About     Contact     Blog',
                      color: Colors.white,
                      size: 18,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              Gap(20),
              Container(
                width: double.infinity,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 15),
                  child: Center(
                    child: CustomText(
                      text: 'Copy© 2023 OpenUI. All rights reserved.',
                      color: Color(0xffC4C4C4),
                      size: 16,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
