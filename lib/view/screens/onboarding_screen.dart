
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_project_newsapp/view/screens/categories_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/onboarding_model.dart';
import 'home_screen.dart';

class onboardingScreen extends StatefulWidget {
  const onboardingScreen({Key? key}) : super(key: key);

  @override
  State<onboardingScreen> createState() => _onboardingScreenState();
}

class _onboardingScreenState extends State<onboardingScreen> {
  final pageController = PageController();
  int current_index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                margin:  EdgeInsets.symmetric(vertical: 10),
                child:Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          child: Text("Skip",style: TextStyle(
                              color: Color(0xff9873d3),
                              fontWeight: FontWeight.bold,
                              fontSize: 25),),
                          onTap: ()
                          {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>categoriesScreen()));
                          }
                      ),
                    ),
                    Expanded(
                      child: Container(

                        child: PageView.builder(
                            controller: pageController,
                            itemCount: boardingItems.length,
                            onPageChanged: (index){
                              setState(() {
                                current_index=index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(boardingItems[index].image,fit: BoxFit.fill,height: 400,),
                                  Text(boardingItems[index].title,style: TextStyle(color: Color(0xff9873d3),fontWeight: FontWeight.bold,fontSize: 20),),
                                  SizedBox(height: 20,),
                                  Center(
                                    child:Text(boardingItems[index].description,style: TextStyle(color: Color(0xff9873d3),fontWeight: FontWeight.bold,fontSize: 19),),
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: pageController,
                      count:  3,
                      axisDirection: Axis.horizontal,
                      effect: const SlideEffect(
                          spacing:  8.0,
                          radius:  10.0,
                          dotWidth:  15.0,
                          dotHeight:  15.0,
                          paintStyle:  PaintingStyle.stroke,
                          strokeWidth:  1.5,
                          dotColor:  Colors.grey,
                          activeDotColor: Color(0xff9873d3)
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          child: Text("NEXT",style: TextStyle(
                              color: Color(0xff9873d3),
                              fontWeight: FontWeight.bold,
                              fontSize: 25),),
                          onTap: ()
                          {
                            if(current_index<2){
                              pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);

                            }
                            else{
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>categoriesScreen()));
                            }}
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
