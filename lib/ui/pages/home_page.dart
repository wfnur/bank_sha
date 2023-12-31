import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/home_latest_transaction_item.dart';
import 'package:bank_sha/ui/widgets/home_service_item.dart';
import 'package:bank_sha/ui/widgets/home_tips_item.dart';
import 'package:bank_sha/ui/widgets/home_user_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: whiteColor,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(fontSize: 10,fontWeight: medium),
          unselectedLabelStyle: blackTextStyle.copyWith(fontSize: 10),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/ic_overview.png',width: 20,color:blueColor ,),
              label: 'Overview'
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
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: purpleColor,
        child: Image.asset('assets/ic_plus_circle.png',width: 24,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal:24),
        children: [
          buildProfile(context),
          buildWallet(),
          buildLevel(),
          buildServices(context),
          buildLatestTransactions(),
          buildSendAgain(),
          buildFriendlyTips()
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top:40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fajar,', style: greyTextStyle.copyWith(fontSize: 16),),
              const SizedBox(height: 2,),
              Text('Ananda',style:blackTextStyle.copyWith(fontSize: 20,fontWeight: semiBold))
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/profile');
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/img_profile.png',))
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle,
                      color: greenColor,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildWallet(){
    return Container(
      width: double.infinity,
      height: 220,
      margin: const EdgeInsets.only(top:30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
          fit:BoxFit.cover,
          image:AssetImage('assets/img_bg_card.png')
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ananda Fajar', style: whiteTextStyle.copyWith(fontSize: 18,fontWeight: medium),),
          const SizedBox(height: 25,),

          Text('**** **** **** 1234', style: whiteTextStyle.copyWith(fontSize: 18,fontWeight: medium,letterSpacing: 6),),
          const SizedBox(height: 21,),

          Text('Balance', style: whiteTextStyle,),
          Text('Rp. 1.0000.0000.0000', style: whiteTextStyle.copyWith(fontSize: 20,fontWeight: semiBold),),


        ],
      ),
    );
  }

  Widget buildLevel(){
    return Container(
      margin: const EdgeInsets.only(top:20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text('Level 1 ',style: blackTextStyle.copyWith(fontWeight: medium),),
              const Spacer(),
              Text('Rp. 1.000.0000 ',style: blackTextStyle.copyWith(fontWeight: semiBold),),
              Text('(55%)',style: greenTextStyle.copyWith(fontWeight: semiBold),),
            ],
          ),
          const SizedBox(height: 15,),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.5,
              minHeight: 8,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBackgroundColor,
            ),
          )
        ],
      ),
    );
  }

  Widget buildServices(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top:30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Services',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),),
          const SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                iconURL: 'assets/ic_topup.png', 
                title: 'Top Up',
                onTap: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServiceItem(
                iconURL: 'assets/ic_send.png', 
                title: 'Send',
                onTap: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServiceItem(iconURL: 'assets/ic_withdraw.png', title: 'With Draw'),
              HomeServiceItem(iconURL: 'assets/ic_more.png', title: 'More'),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLatestTransactions(){
    return Container(
      margin: const EdgeInsets.only(top:30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transactions',
            style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold)
          ),
          const SizedBox(height: 14,),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(top:20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor
            ),
            child:const Column(
              children: [
                HomeLatestTransactionItem(
                  iconURL: 'assets/ic_transaction_cat1.png', 
                  title: 'Top Up', 
                  time: 'Yesterday', 
                  value: '+ 450.000'
                ),
                HomeLatestTransactionItem(
                  iconURL: 'assets/ic_transaction_cat2.png', 
                  title: 'Cashback', 
                  time: 'Desember 19', 
                  value: '+ 550.000'
                ),
                HomeLatestTransactionItem(
                  iconURL: 'assets/ic_transaction_cat3.png', 
                  title: 'Shopping', 
                  time: 'Desember 25', 
                  value: '- 400.000'
                ),
                HomeLatestTransactionItem(
                  iconURL: 'assets/ic_transaction_cat4.png', 
                  title: 'Top Up', 
                  time: 'Yesterday', 
                  value: '+ 450.000'
                ),
                HomeLatestTransactionItem(
                  iconURL: 'assets/ic_transaction_cat5.png', 
                  title: 'Top Up', 
                  time: 'Yesterday', 
                  value: '+ 450.000'
                ),
              ],)
          )
        ],
      ),
    );
  }

  Widget buildSendAgain(){
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Send Again', style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),),
          const SizedBox(height: 14,),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeUserItem(imgURL: 'assets/img_friend1.png', username: 'yuanniita'),
                HomeUserItem(imgURL: 'assets/img_friend2.png', username: 'naddd'),
                HomeUserItem(imgURL: 'assets/img_friend3.png', username: 'puutrii'),
                HomeUserItem(imgURL: 'assets/img_friend4.png', username: 'marthiaa'),
                HomeUserItem(imgURL: 'assets/img_friend1.png', username: 'fajjjar'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFriendlyTips(){
    return Container(
      margin: const EdgeInsets.only(top:30,bottom: 50),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Friendly Tips',style: blackTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),),
          const SizedBox(height: 14,),
          Wrap(
            spacing: 17,
            runSpacing: 18,
            children: [
              HomeTipsItem(imgURL: 'assets/img_tips1.png', title: 'Title 1', url: Uri.parse('https://www.google.com')),
              HomeTipsItem(imgURL: 'assets/img_tips2.png', title: 'Title 2', url: Uri.parse('https://www.youtube.com')),
              HomeTipsItem(imgURL: 'assets/img_tips3.png', title: 'Title 3', url: Uri.parse('https://www.google.com')),
              HomeTipsItem(imgURL: 'assets/img_tips4.png', title: 'Title 4', url: Uri.parse('https://www.google.com')),
            ],
          )
        ],
      ),
    );
  }

}
