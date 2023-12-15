import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
const OnboardingPage({ Key? key }) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currIndex = 0;
  CarouselController carouselController = CarouselController();
  List<String> titles = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together'
  ];

  List<String> caption = [
    'Our system help you to\nachive better goals',
    'We provide tips for you so that\n you can adapt easier',
    'We weill guide you to\nwhere you need to'
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset('assets/img_onboarding1.png',height: 331,),
                Image.asset('assets/img_onboarding2.png',height: 331,),
                Image.asset('assets/img_onboarding3.png',height: 331,),
              ],
              options: CarouselOptions(
                height: 331,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currIndex=index;
                  });
                },
              ),
              carouselController: carouselController,
              ),
            const SizedBox(height: 80,),
            Container(
              //margin kanan kiri
              margin: const EdgeInsets.symmetric(
                horizontal: 24
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 24
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                Text(
                  titles[currIndex],
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 26,),
                Text(
                  caption[currIndex],
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 26,),
                currIndex == 2 ?
                Column(
                  children: [
                    //get started
                    CustomFilledButton(
                      title: "Get Started",
                      onPressed: () { Navigator.pushNamedAndRemoveUntil(context, '/sign-up', (route) => false);},
                    ),
                    const SizedBox(height: 15,),
                    
                    //sign in
                    CustomTextButton(
                      title: "Sign in",
                      onPressed: () { Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);},
                    )
                  ],
                )
                : Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currIndex == 0 ? blueColor : lightBackgroundColor
                      ),
                    ),
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:currIndex == 1 ? blueColor : lightBackgroundColor
                      ),
                    ),
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:currIndex == 2 ? blueColor : lightBackgroundColor
                      ),
                    ),
                    const Spacer(),
                    CustomFilledButton(
                      title: "Continue",
                      onPressed: () => carouselController.nextPage(),
                      width: 150,
                      height: 50,
                    ),
                  ],
                )

              ]),
            )
          ],
        ),
      ),
    );
  }
}