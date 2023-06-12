import 'package:flutter/material.dart';
import 'package:flutter_news/screens/main_screen.dart';
import 'package:flutter_news/widgets/onboard.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding_screen';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  List<Onboard> onboards = [
    Onboard(
        ilustrator: 'assets/images/onboard-1.svg',
        title: 'Welcome to F\'News',
        description:
            'Thank you for choosing F\'News as your trusted news source. Get ready to explore a wide range of news articles from reputable sources. Let\'s introduce you to our app.'),
    Onboard(
        ilustrator: 'assets/images/onboard-2.svg',
        title: 'Explore News Categories',
        description:
            'Discover a diverse selection of news categories available on our platform. Browse through topics such as politics, sports, technology, entertainment, health, and more. Tap on a category to view related news articles.'),
    Onboard(
        ilustrator: 'assets/images/onboard-3.svg',
        title: 'Access Exclusive Content',
        description:
            'Unlock premium and exclusive news articles by purchasing them. Gain access to in-depth analyses, investigative reports, and special features. We offer a seamless buying experience within the app.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboards.length,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final Onboard item = onboards[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(item.ilustrator),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                item.description,
                                style: TextStyle(color: Colors.grey[600]),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 4.0,
                  children: [
                    ...List.generate(
                        onboards.length,
                        (index) => OnboardDot(
                              isActive: index == _pageIndex,
                            ))
                  ],
                ),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       _pageController.nextPage(
            //         duration: const Duration(milliseconds: 300),
            //         curve: Curves.easeInOut,
            //       );
            //       // Navigator.pushReplacementNamed(context, MainScreen.routeName);
            //     },
            //     child: const Text('Ahay')),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, MainScreen.routeName);
                    },
                    child: const Text('Get Started')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
