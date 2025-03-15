import 'package:flutter/material.dart';
import 'package:splash_text_field/core/app_color/app_color.dart';
import 'package:splash_text_field/screens/home/widgets/input_text_field.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var userNameController = TextEditingController();

  var phoneController = TextEditingController();

  var countryController = TextEditingController();

  var cardController = TextEditingController();

  bool isPasswordObscure = true;
  List<String> countries = [
    "United States",
    "Canada",
    "Germany",
    "France",
    "Egypt",
    "Brazil",
    "India",
    "Japan",
    "Saudi Arabia",
    "Spain",
    "Italy",
    "China"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.colorBlack,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 70),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 40,
                    color: AppColor.colorYellow,
                    fontWeight: FontWeight.w700,
                    wordSpacing: 10,
                  ),
                ),
              ),
              InputTextField(
                lable: "Email",
                iconData: Icons.email_outlined,
                controller: emailController,
                hint: "Enter your email",
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a your email";
                  }
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    return "Enter a valid email";
                  }
                  return null;
                },
                keyType: TextInputType.emailAddress,
                isObscure: false,
              ),
              SizedBox(
                height: 22,
              ),
              InputTextField(
                lable: "Password",
                iconData: Icons.remove_red_eye_outlined,
                controller: passwordController,
                hint: "Enter your password",
                keyType: TextInputType.text,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a valid password";
                  }
                  if (value.length <= 8) {
                    return "Password should be at least 9 characters";
                  }
                  return null;
                },
                onPressed: () {
                  isPasswordObscure = !isPasswordObscure;
                  setState(() {});
                },
                isObscure: isPasswordObscure,
              ),
              SizedBox(
                height: 22,
              ),
              InputTextField(
                  lable: "Full Name",
                  iconData: Icons.person,
                  controller: userNameController,
                  hint: "Enter your name",
                  validate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Enter a valid name";
                    }

                    List<String> words = value.trim().split(RegExp(r'\s+'));

                    if (words.length != 3) {
                      return "Write your full name (first, middle, and last)";
                    }

                    return null;
                  },
                  keyType: TextInputType.text,
                  isObscure: false),
              SizedBox(
                height: 22,
              ),
              InputTextField(
                  lable: "Phone",
                  iconData: Icons.phone,
                  controller: phoneController,
                  hint: "Enter yourPhone",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a valid phone number";
                    }
                    final bool passwordValid =
                        RegExp(r"^(\+201|01|00201)[0-2,5]{1}[0-9]{8}")
                            .hasMatch(value);
                    if (!passwordValid) {
                      return "Enter an egyptian number";
                    }

                    return null;
                  },
                  keyType: TextInputType.number,
                  isObscure: false),
              SizedBox(
                height: 22,
              ),
              InputTextField(
                  lable: "Country",
                  iconData: Icons.location_on,
                  controller: countryController,
                  hint: "Enter your country",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your country";
                    }
                    if (!RegExp(r"^[A-Za-z\s]+$").hasMatch(value)) {
                      return "Enter a valid country name (letters only)";
                    }
                    if (!countries.contains(value.trim())) {
                      return "Wrong country";
                    }
                    return null;
                  },
                  keyType: TextInputType.text,
                  isObscure: false),
              SizedBox(
                height: 22,
              ),
              InputTextField(
                  lable: "Card",
                  iconData: Icons.credit_card,
                  controller: cardController,
                  hint: "Enter your card number",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a your card number";
                    }
                    if (!RegExp(r"^5[1-5][0-9]{14}$").hasMatch(value) &&
                        !RegExp(r"^2(22[1-9]|2[3-9][0-9]|[3-6][0-9]{2}|7[0-1][0-9]|720)[0-9]{12}$")
                            .hasMatch(value)) {
                      return "Enter a valid card number";
                    }
                    return null;
                  },
                  keyType: TextInputType.phone,
                  isObscure: false),
              SizedBox(
                height:
                30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.cardColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10)),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            color: AppColor.colorYellow, fontSize: 25),
                      )),
                  SizedBox(
                    height: 30,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
