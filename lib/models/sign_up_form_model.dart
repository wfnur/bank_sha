class SignUpFormModel {
  String? name;
  String? email;
  String? password;
  String? pin;
  String? profilePicture;
  String? ktp;

  SignUpFormModel({
    this.name,
    this.email,
    this.password,
    this.pin,
    this.profilePicture,
    this.ktp,
  });

  // Factory constructor to create an instance from JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
      'profile_picture': profilePicture,
      'ktp': ktp,
    };
  }

  //copy signupformmodel mempertahankan data yang lama dan yang baru jika berpindah halaman
  SignUpFormModel copyWith({
    String? pin,
    String? profilePicture,
    String? ktp,
  }) {
    return SignUpFormModel(
      name: name,
      email: email,
      password: password,
      pin: pin ?? this.pin, //pin menunjukan di copywith, this.pin menunjukan di model (atas)
      profilePicture: profilePicture ?? this.profilePicture,
      ktp: ktp ?? this.ktp,
    );
  }

}