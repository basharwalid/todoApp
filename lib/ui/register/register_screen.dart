import 'package:flutter/material.dart';
import 'package:todo/ui/HomeScreen.dart';
import 'package:todo/ui/components/CustomFormField.dart';
import 'package:todo/validation%20utils.dart';

class registerScreen extends StatelessWidget {
  static const String routeName = 'register';
  var formkey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var Emailcontroller = TextEditingController();
  var Passwordcontroller = TextEditingController();
  var PasswordConfirmcontroller = TextEditingController();
  @override
  //#DFECDB
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color(0xffDFECDB),
            image: DecorationImage(
                image: AssetImage('assets/images/SIGN IN – 1.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Register"),
          ),
          body: Container(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    CustomFormField(
                      controller: namecontroller,
                      label: "Full name",
                      validator:(text){
                        if(text==null || text.trim().isEmpty){
                          return 'please Enter Full name';
                        }
                      },
                    ),
                    CustomFormField(
                      controller: Emailcontroller,
                      label: "Email",
                      keyboardtype: TextInputType.emailAddress,
                      validator: (text) {
                    if(text==null || text.trim().isEmpty){
                    return 'please Enter email';
                    }
                    if (!validationUtils.isValidEmail(text))
                    {
                      return "please enter a valid email";
                    }
                    },
                    ),
                    CustomFormField(
                      validator: (text){
                        if(text==null || text.trim().isEmpty){
                          return 'please Enter Password';
                        }
                        if(text.length>6){
                          return 'Password should be at least 6 chars';
                        }
                      },
                      controller: Passwordcontroller,
                      label: "Password",
                      ispassword: true,
                    ),
                    CustomFormField(
                      validator:(text){
                        if(text==null || text.trim().isEmpty){
                          return 'please Enter Password confirmation';
                        }
                        if(Passwordcontroller.text != text){
                          return "Password doesn't match";
                        }
                        return null;
                      },
                      controller: PasswordConfirmcontroller,
                      label: "Confirm Password",
                      ispassword: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12)
                          ),
                          onPressed: (){
                            register();
                            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                          }, child: const Text("Register" ,
                        style: TextStyle(
                          fontSize: 24
                        ),
                      )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }

  void register() {
    if(formkey.currentState!.validate()== false){
      return;
    }
  }
}
