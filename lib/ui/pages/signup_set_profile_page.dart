import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/signup_set_ktp_page.dart';
import 'package:bank_sha/ui/pages/widgets/buttons.dart';
import 'package:bank_sha/ui/pages/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;

  SignupSetProfilePage({
    super.key, 
    required this.data
  });

  @override
  State<SignupSetProfilePage> createState() => _SignupSetProfilePageState();
}

class _SignupSetProfilePageState extends State<SignupSetProfilePage> {
  
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;
  //For Web
  Uint8List? imageBytes;

  bool validate(){
    if(pinController.text.length != 6){
      return false;
    }
    return true;
  }
  
  @override
  Widget build(BuildContext context) {
    print(widget.data.toJson());
    
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.only(top:100,bottom: 100),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_logo_light.png')
              )
            ),
          ),
          Text(
            'Join Us to Unlock\nYour Growth',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold
            ),
          ),
          const SizedBox(height: 30,),
          
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    // final image = await selectImage();
                    // setState(() {
                    //   selectedImage = image;
                    // });

                    final image = await selectImage();
                    if (image != null) {
                      final bytes = await image.readAsBytes(); // Read the bytes asynchronously
                      setState(() {
                        selectedImage = image;
                        imageBytes = bytes; // Store the bytes in a variable
                      });
                    }
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBackgroundColor,
                      image: selectedImage == null 
                          ? null 
                          : DecorationImage(
                            fit: BoxFit.cover,
                            //image:FileImage(File(selectedImage!.path))
                            image: MemoryImage(imageBytes!),
                          ),
                    ),
                    child: selectedImage != null ? null :
                     Center(
                      child: Image.asset('assets/ic_upload.png',width: 32,),
                    ),
                  ),
                ),
                
                const SizedBox(height: 16,),

                Text('Jhon Wijk',style: blackTextStyle.copyWith(fontWeight: medium,fontSize: 18),),
                const SizedBox(height: 30,),

                CustomFormField(
                  title: 'Set Pin (6 digit Number)',
                  obscureText: true,
                  controller: pinController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30,),

                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () async {
                    if(validate())
                    {
                      String? base64Image;
                      final bytes = await selectedImage!.readAsBytes();
                      base64Image = base64Encode(bytes);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => 
                        SignupSetKTPPage(
                          data: widget.data.copyWith(
                          pin:pinController.text,
                          profilePicture:selectedImage == null ? null : 'data:image/png;base64${base64Image})}'
                          ),
                        ),
                      ),
                      );
                    }
                    else{
                      showCustomSnackbar(context, "Pin Harus 6 Digit");
                    }


                    
                  },
                )
                      
              ],
            ),
          ),
        ],
      ),
    );
  }
}