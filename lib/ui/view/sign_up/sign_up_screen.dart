import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safir_challenge/provider/signup_provider.dart';
import 'package:safir_challenge/strings/strings.dart';
import 'package:provider/provider.dart';
import 'package:safir_challenge/ui/view/sign_in/sign_in_screen.dart';
import '../../../r.dart';
import '../../theme/app_txt_styles.dart';
import '../common_widgets/custom_shawdow_textfield.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SignUpProvider signUpProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    signUpProvider = Provider.of<SignUpProvider>(context, listen: true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: _getBaseContainer(),
      ),
    );
  }

  Widget _getBaseContainer() {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(top: 70, bottom: 40),
          width: double.infinity,
          color: Colors.white,
          child: Image.asset(
            R.assetsIconsLogo,
            width: 150,
            height: 100,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.center,
          child: Text(
            AppStrings.signUpNewAccount,
            style: AppTxtStyle.getAppMainTxtStyle(
                size: 20, fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                _getEmailWidget(),
                const SizedBox(
                  height: 15,
                ),
                _getPasswordWidget(),
                const SizedBox(
                  height: 15,
                ),
                _getConfirmPasswordWidget(),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (signUpProvider.password ==
                          signUpProvider.confirmPassword) {
                        signUpProvider
                            .registerNewUserWithEmail()
                            .then(((userCredential) {
                          if (userCredential != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                          }
                        }));
                      }
                    }
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            R.assetsIconsTick,
                            color: Colors.white,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppStrings.signUp,
                              textAlign: TextAlign.center,
                              style: AppTxtStyle.getAppMainTxtStyleWhiteColor(
                                  size: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _getEmailWidget() {
    return CustomShadowFormTextField(
      showStickyLabel: true,
      labelText: AppStrings.email,
      stickyLabelStyle:
          AppTxtStyle.getAppMainTxtStyle(size: 16, fontWeight: FontWeight.w700),
      isMandatory: true,
      maxLines: 1,
      isEditable: true,
      worksAsPopup: false,
      hintText: AppStrings.email,
      validator: (String? value) {
        signUpProvider.email = value;
        if (signUpProvider.email == null ||
            signUpProvider.email!.trim().isEmpty) {
          return AppStrings.required;
        } else if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(signUpProvider.email!)) {
          return "${AppStrings.enterYourEmailCorrectly} 'Example: Voithy@emailService.com'";
        }
        return null;
      },
      onValueChanged: (value) {
        signUpProvider.email = value;
      },
      onSaved: (String? value) {
        signUpProvider.email = value;
      },
    );
  }

  Widget _getPasswordWidget() {
    return CustomShadowFormTextField(
      showStickyLabel: true,
      labelText: AppStrings.password,
      stickyLabelStyle:
          AppTxtStyle.getAppMainTxtStyle(size: 16, fontWeight: FontWeight.w700),
      isMandatory: true,
      maxLines: 1,
      hintText: AppStrings.password,
      isEditable: true,
      worksAsPopup: false,
      obscureText: true,
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return AppStrings.required;
        }
        return null;
      },
      onValueChanged: (password) {
        signUpProvider.password = password;
      },
      onSaved: (String? password) {
        signUpProvider.password = password;
      },
    );
  }

  Widget _getConfirmPasswordWidget() {
    return CustomShadowFormTextField(
      showStickyLabel: true,
      labelText: AppStrings.confirmPassword,
      stickyLabelStyle:
          AppTxtStyle.getAppMainTxtStyle(size: 16, fontWeight: FontWeight.w700),
      isMandatory: true,
      hintText: AppStrings.confirmPassword,
      maxLines: 1,
      isEditable: true,
      worksAsPopup: false,
      obscureText: true,
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return AppStrings.required;
        }
        return null;
      },
      onValueChanged: (password) {
        signUpProvider.confirmPassword = password;
      },
      onSaved: (String? password) {
        signUpProvider.confirmPassword = password;
      },
    );
  }
}
