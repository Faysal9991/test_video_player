import 'package:flutter/material.dart';
import 'package:flutter_test_2/component/custom_space.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(
            children: [
              Text("Trending Videos",style: Theme.of(context).textTheme.headlineSmall,),
               gap(hight: 16),
               Container(
              color: Colors.white,
              child: Column(
                children: [
                  
                ],
              ),
               )
            ],
          ),
        ),
      ),
    );
  }
}