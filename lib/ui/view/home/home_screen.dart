import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safir_challenge/provider/signup_provider.dart';
import 'package:safir_challenge/strings/strings.dart';
import 'package:provider/provider.dart';
import '../../../r.dart';
import '../../theme/app_txt_styles.dart';
import '../common_widgets/custom_shawdow_textfield.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
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
            AppStrings.welcomeToHomeScreen,
            style: AppTxtStyle.getAppMainTxtStyle(
                size: 20, fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
