import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: whiteColor,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(fontSize: 10,fontWeight: medium),
          unselectedLabelStyle: blackTextStyle.copyWith(fontSize: 10,fontWeight: medium),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/ic_overview.png',width: 20,color: blueColor,),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/ic_history.png',width: 20,),
              label: 'History'
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/ic_statistic.png',width: 20,),
              label: 'Statistic'
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/ic_reward.png',width: 20,),
              label: 'Rewards'
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: purpleColor,
        onPressed: (){},
        child: Image.asset('assets/ic_plus_circle.png',width: 24,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}