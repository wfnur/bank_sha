import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/widgets/home_latesttrans.dart';
import 'package:bank_sha/ui/pages/widgets/home_service_item.dart';
import 'package:bank_sha/ui/pages/widgets/home_tips_item.dart';
import 'package:bank_sha/ui/pages/widgets/home_user_item.dart';
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildProfile(),
          buildWalletCard(),
          buildLevel(),
          buildService(),
          buildLatestTransaction(),
          buildSendAgain(),
          buildFriendlyTips()
        ],
      ),
    );
  }

  Widget buildProfile(){
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Howdy,',style: greyTextStyle.copyWith(fontSize: 16),),
              const SizedBox(height: 2,),
              Text('Jho Wijk',style: blackTextStyle.copyWith(fontSize: 20,fontWeight: semiBold),)
            ],
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/img_profile.png'))
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor
                ),
                child: Center(
                  child: Icon(Icons.check_circle,color: greenColor,size: 18,)
                )
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildWalletCard(){
    return Container(
      width: double.infinity,
      height: 220,
      margin: const EdgeInsets.only(top:30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/img_bg_card.png')
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jhon Wijk ',style: whiteTextStyle.copyWith(fontSize: 18,fontWeight: medium),),
          const SizedBox(height: 28,),
          Text('**** **** **** 8990 ',style: whiteTextStyle.copyWith(fontSize: 18,fontWeight: medium,letterSpacing: 6),),
          const SizedBox(height: 21,),
          Text('Balance',style: whiteTextStyle),
          Text('Rp. 1.000.000',style: whiteTextStyle.copyWith(fontSize: 24,fontWeight: semiBold)),
        ],
      ),
    );
  }

  Widget buildLevel(){
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(top:20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor
      ),
      child: Column(
        children: [
          Row(
            children:  [
              Text('Level : Beginer',style: blackTextStyle.copyWith(fontWeight: semiBold),),
              const Spacer(),
              Text('55%',style: greenTextStyle.copyWith(fontWeight: semiBold),),
              Text(' of Rp. 20.000',style: blackTextStyle),
            ],
          ),
          const SizedBox(height: 10,),
          ClipRRect(
              borderRadius: BorderRadius.circular(55),
              child: const LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 14, 189, 28)),
                value: 0.8,
            ),
          )
        ],
      ),
    );
  }

  Widget buildService(){
    return Container(
      margin: const EdgeInsets.only(top:40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Services',style: blackTextStyle.copyWith(fontSize:16 ,fontWeight: semiBold),),
          const SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(iconUrl: 'assets/ic_topup.png', title: 'Top Up',onTap: () {},),
              HomeServiceItem(iconUrl: 'assets/ic_send.png', title: 'Send',onTap: () {},),
              HomeServiceItem(iconUrl: 'assets/ic_withdraw.png', title: 'Withdraw',onTap: () {},),
              HomeServiceItem(iconUrl: 'assets/ic_more.png', title: 'More',onTap: () {},),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLatestTransaction(){
    return Container(
      margin: const EdgeInsets.only(top:40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Latest Transaction',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold)),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(top:14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor
            ),
            child: const Column(
              children: [
                HomeLatesttrans(iconUrl: 'assets/ic_transaction_cat1.png', title: 'Topup', time: 'Yesterday', value: '+45.000'),
                HomeLatesttrans(iconUrl: 'assets/ic_transaction_cat2.png', title: 'Cashback', time: 'Sep 11', value: '+22.000'),
                HomeLatesttrans(iconUrl: 'assets/ic_transaction_cat3.png', title: 'Withdraw', time: 'Sep 1', value: '-450.000'),
                HomeLatesttrans(iconUrl: 'assets/ic_transaction_cat4.png', title: 'Transfer', time: 'Aug 17', value: '-945.000'),
                HomeLatesttrans(iconUrl: 'assets/ic_transaction_cat5.png', title: 'Electric', time: 'Aug 1', value: '-345.000'),
              ],
            ),
          )

        ],
      ),
    );
  }

  Widget buildSendAgain(){
    return Container(
      margin: const EdgeInsets.only(top:40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Send Again',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold)),
          const SizedBox(height: 14,),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeUserItem(imageUrl: 'assets/img_friend1.png', username: 'yuanita'),
                HomeUserItem(imageUrl: 'assets/img_friend2.png', username: 'xxsfd'),
                HomeUserItem(imageUrl: 'assets/img_friend3.png', username: 'zzsdf'),
                HomeUserItem(imageUrl: 'assets/img_friend4.png', username: 'yuanita'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFriendlyTips(){
    return Container(
      margin: const EdgeInsets.only(top:40,bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Friendly Tips',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold)),
          const SizedBox(height: 14,),
          const Wrap(
            spacing: 17,
            runSpacing: 18,
            children: [
              HomeTipsItem(imageUrl: 'assets/img_tips1.png', title: 'Best for using a credit card', url: 'https://www.google.com/'),
              HomeTipsItem(imageUrl: 'assets/img_tips2.png', title: 'Best for using a credit card', url: 'https://www.google.com/'),
              HomeTipsItem(imageUrl: 'assets/img_tips3.png', title: 'Best for using a credit card', url: 'https://www.google.com/'),
              HomeTipsItem(imageUrl: 'assets/img_tips4.png', title: 'Best for using a credit card', url: 'https://www.google.com/'),
            ],
          )
          
        ],
      ),
    );
  }

}