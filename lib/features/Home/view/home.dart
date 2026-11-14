import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/features/CheckOut/view/checkout.dart';
import 'package:openfashion/features/Home/data/cover_model.dart';
import 'package:openfashion/features/Home/data/product_model.dart';
import 'package:openfashion/features/Home/widgets/home_footer.dart';
import 'package:openfashion/features/Home/widgets/home_header.dart';
import 'package:openfashion/widgets/custom_appbar_widget.dart';
import 'package:openfashion/widgets/custom_line.dart';
import 'package:openfashion/widgets/custom_text.dart';

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
              HomeHeader(),
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
                  final item = ProductModel.products[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Checkout(
                          name: item.name,
                          image: item.imageUrl,
                          price: item.price,
                          description: item.description,
                        ),
                      ),
                    ),
                    child: Column(
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
                    ),
                  );
                },
              ),
              Gap(20),
              Center(child: CustomLine(text: 'You may also like')),
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

              /// Footer
              Footer(),
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
