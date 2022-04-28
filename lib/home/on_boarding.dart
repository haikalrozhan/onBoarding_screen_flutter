// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_boarding_app/model/on_boarding_content.dart';

import 'home.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController _controller;
  final contents = OnBoardingContent.generateOnBoardingContent();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (int index){
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: contents.length,
              itemBuilder: (_, index){
                return Padding(
                  padding: EdgeInsets.only(top: 120, left: 40, right: 40),
                  child: Column(children: [
                    Image.asset(contents[index].image!, height: 300,),
                    SizedBox(height: 30),
                    Text(contents[index].title!, 
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                    SizedBox(height: 15),
                    Text(contents[index].description!, 
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.grey[600],),),
                  ],),
                );
              }),
          ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            List.generate(contents.length, (index) => buildDot(index, context),
            ),
          ),
        ),
        Container(
             margin: EdgeInsets.all(40),
             height: 60,
             width: double.infinity,
             child: ElevatedButton(
               child: Text(currentIndex == contents.length -1 ? 'Continue' : 'Next', style: TextStyle(fontSize: 19)),
               onPressed: () {
                 if(currentIndex == contents.length -1){
                   Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
                 }
                 _controller.nextPage(duration: Duration(microseconds: 100), curve: Curves.bounceIn,);
               },
               style: ElevatedButton.styleFrom(
                 elevation: 0,
                 primary: Theme.of(context).primaryColor,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20),
                 )
               ),
               
             ),
           )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
              height: 10,
              width: currentIndex == index? 30 : 10, 
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor,
              )
            );
  }
}

