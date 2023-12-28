import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconURL;
  final String title;
  final VoidCallback? onTap;
  
const ProfileMenuItem({ 
  Key? key, 
  required this.iconURL, 
  required this.title, 
  this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Image.asset(iconURL,width: 24,),
            const SizedBox(width: 18,),
            Text(title,style: blackTextStyle.copyWith(fontSize: 14,fontWeight: medium),)
          ],
        ),
      ),
    );
  }
}