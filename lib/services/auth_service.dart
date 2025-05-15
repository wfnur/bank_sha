import 'dart:convert';
import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/models/signin_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class AuthService {
  // This class will handle authentication-related tasks
  // such as login, logout, and user session management.

  Future<bool> checkEmail(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/is-email-exist'),
        body: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        // Email is available
        return jsonDecode(response.body)['is_email_exist'];
      } else {
        // Email is already taken
        return jsonDecode(response.body)['errors'];
      }
    } catch (e) {
      // Handle error
      rethrow;
    }
  }

  // Example method for user login
  Future<UserModel> login(SignInFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/login'),
        body: data.toJson()
      );

      if(res.statusCode == 200){
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        //store credential
        await storeCredentialToLocal(user);
        return user;
      }
      else{
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  // Example method for user logout
  Future<void> logout() async {
    // Implement your logout logic here
  }

  Future<UserModel> register(SignUpFormModel data)async{
    try {
      
      final res = await http.post(
        Uri.parse('$baseUrl/register'),
        body: data.toJson()
      );

      if(res.statusCode == 200){
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        //store credential
        await storeCredentialToLocal(user);

        return user;
      }
      else{
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentialToLocal(UserModel user) async{
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key:'token',value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);

    } catch (e) {
      rethrow;
      
    }
  }

  Future<SignInFormModel> getCredentialFromLocal() async{
    try {
      const storage = FlutterSecureStorage();
      Map<String,String> values = await storage.readAll();

      if(values['email'] == null || values['password']==null){
        throw 'unauthenticated';
      }else{
        final SignInFormModel data = SignInFormModel(
          email: values['email'], 
          password: values['password']
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async{
    try {
      String token ='';
      const storage = FlutterSecureStorage();
      String? value = await storage.read(key: 'token');

      if(value != null ){
        token = 'Bearer $value';
      }

      return token;

    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearLocalStorage() async{
    const storage = FlutterSecureStorage();
    await storage.deleteAll();

  }

  

}