import 'package:dcloth/components/custom_surfix_icon.dart';
import 'package:dcloth/components/default_button.dart';
import 'package:dcloth/components/form_error.dart';
import 'package:dcloth/constants.dart';
import 'package:dcloth/main.dart';
// import 'package:dcloth/screens/donate.dart';
import 'package:dcloth/screens/donate/model/donate.dart';
import 'package:dcloth/screens/home/home_screen.dart';
import 'package:dcloth/screens/login_success/login_success_screen.dart';
import 'package:dcloth/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Text(
                "Lets Donate!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Help each other",
                textAlign: TextAlign.center,
              ),
              Image.asset(
                "assets/images/donasi 2.png",
                height: getProportionateScreenWidth(200),
                width: getProportionateScreenWidth(200),
              ),
              DonateForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class DonateForm extends StatefulWidget {
  List donate = [];
  DonateForm({Key? key}) : super(key: key);

  @override
  State<DonateForm> createState() => _DonateFormState();
}

class _DonateFormState extends State<DonateForm> {
  final _formKey = GlobalKey<FormState>();
  late String address;
  late String contact;
  late String weight;
  final List<String> errors = [];

  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var index = 0;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildContactFormField(),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          buildWeightFormField(),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          buildAddressFormField(),
          formError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.9,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 59, 82, 228),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text("Donate!"),
                onPressed: () async {
                  final data = DonateModel(
                      id: index,
                      phone: contactController.text,
                      address: addressController.text,
                      weight: weightController.text);
                  setState(() {
                    index++;
                  });
                  MyApp().databaseHelper.insertWatchlist(data);
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }),
          )
        ],
      ),
    );
  }

  TextFormField buildWeightFormField() {
    return TextFormField(
      controller: weightController,
      keyboardType: TextInputType.number,
      onSaved: (newValue) => weight = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kDonatesNullError)) {
          setState(() {
            errors.remove(kDonatesNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kDonatesNullError)) {
          setState(() {
            errors.add(kDonatesNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Weight",
        hintText: "Weight of your donation",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurfix(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildContactFormField() {
    return TextFormField(
      controller: contactController,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => contact = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.remove(kPhoneNumberNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.add(kPhoneNumberNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Contact",
        hintText: "Contact person",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurfix(
          svgIcon: "assets/icons/Phone.svg",
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: addressController,
      keyboardType: TextInputType.streetAddress,
      onSaved: (newValue) => address = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kAddressNullError)) {
          setState(() {
            errors.remove(kAddressNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kAddressNullError)) {
          setState(() {
            errors.add(kAddressNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurfix(
          svgIcon: "assets/icons/Location point.svg",
        ),
      ),
    );
  }
}
