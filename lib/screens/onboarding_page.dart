import 'package:flutter/material.dart';
import 'package:layaouts/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? showHome = prefs.getBool('showHome');
}
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  final controller = PageController();
  @override
  void dispose(){
    controller.dispose();

    super.dispose();
  }

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom:80),
          child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() => isLastPage = index == 2);
              },
              children: [
                Container(
                  color: Colors.red,
                  child: const Center(child: Text('Page 1',style: TextStyle(fontSize: 40, color: Colors.white))),
                ),
                Container(
                  color: Colors.indigo,
                  child: const Center(child: Text('Page 2',style: TextStyle(fontSize: 40, color: Colors.white))),
                ),
                Container(
                  color: Colors.green,
                  child: const Center(child: Text('Page 3',style: TextStyle(fontSize: 40, color: Colors.white))),
                ),
              ]
          ),
        ),
        bottomSheet: isLastPage ? TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
                backgroundColor: Colors.teal.shade700,
                minimumSize: const Size.fromHeight(80),
              ),
              onPressed: () async{
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('showHome', true);
                //https://youtu.be/AmsXazhGMQ0?t=201
                
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: const Text('Get Started', style: TextStyle(fontSize: 24),)
            ) :
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: const Text('Skip',style: TextStyle(fontSize: 20),)),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                        spacing: 16,
                        dotColor: Colors.black87,
                        activeDotColor: Colors.indigo,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500) ,
                        curve: Curves.easeInOut),
                    ),
                  ),
                  TextButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500) ,
                          curve: Curves.easeInOut),
                      child: const Text('Next',style: TextStyle(fontSize: 20),)),
                ],
              ),
        ),
    );
  }
}
