import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:testapp/components/authTextField.dart';
import 'package:testapp/controllers/databaseController.dart';
import '../../constants/constants.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainOrangeColor,
      body: _SignInHome(),
    );
  }
}

class _SignInHome extends StatelessWidget {
   _SignInHome({super.key});
  
  //createing an object from database controller
  DatabaseController db = DatabaseController();
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: mainDarkColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(100.0)
                ),
            ),
            child: const Text(
              'Registraion',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: mainTextColor,
                ),
            ),
          ),
          // here is the body of the application in sign in Page
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //the logo and wellcome text to registration to the app
                  Padding(
                    padding: const EdgeInsets.all(defaultPaddingSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.app_registration,
                          size: 35.0,
                          color: mainDarkColor,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          "Fast and simple registraion",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: mainTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //inputs fieds from the user to get data 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      AuthTextField(
                        hintTextValue: 'Name',
                        iconName: Icon(Icons.person),
                        obscurveText: false,
                        borderColor: mainOrangeColor,
                        focusBorderColor: mainDarkColor,
                      ),
                      SizedBox(height: defaultPaddingSpace),
                      AuthTextField(
                        hintTextValue: 'Gmail',
                        iconName: Icon(Icons.email),
                        obscurveText: false,
                        borderColor: mainOrangeColor,
                        focusBorderColor: mainDarkColor,
                      ),
                      SizedBox(height: defaultPaddingSpace),
                      AuthTextField(
                        hintTextValue: 'PhoneNumber',
                        iconName: Icon(Icons.phone),
                        obscurveText: false,
                        borderColor: mainOrangeColor,
                        focusBorderColor: mainDarkColor,
                      ),
                      SizedBox(height: defaultPaddingSpace),
                      AuthTextField(
                        hintTextValue: 'Password',
                        iconName: Icon(Icons.lock),
                        obscurveText: true,
                        borderColor: mainOrangeColor,
                        focusBorderColor: mainDarkColor,
                      ),
                    ],
                  ),
                  //THE SIGN IN BUTTON 
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: defaultPaddingSpace),
                    child: GestureDetector(
                      onTap: () {
                        db.addUserToDataBase(
                          userName: 'amir', 
                          phoneNumber: '89658494262', 
                          userPassword: '1234567', 
                          userEmail: 'testAmir@test.ru',
                          );

                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: mainDarkColor,
                        ),
                        child: const Padding( padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Registration",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: mainOrangeColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ALL READY HAVE AN ACC BUTTON? NAVIGATE TO LOGIN PAGE CLICKABLE
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPaddingSpace),
                    child: GestureDetector(
                      onTap: () => {
                        context.router.navigateBack(),
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "All ready have an Account?",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: mainDarkColor,
                            ),
                          ),
                          Icon(
                            Icons.login,
                            size: 25,
                            color: mainTextColor,
                          )
                        ],
                      ),
                    ),
                  ) 

                ], 
                // here is the end of the chidrens in the body in sign in page
              ),
            )),

        ],
      ) 
    );
  }
}