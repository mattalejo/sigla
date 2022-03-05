import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:dropdown_formfield/dropdown_formfield.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final controller_name = TextEditingController();
  final controller_age = TextEditingController();
  final controller_height = TextEditingController();
  final controller_weight = TextEditingController();

  TextEditingController dateCtl = TextEditingController();

  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: controller_name,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                  return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller_age,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.cake),
                      labelText: "Date of Birth"),
                      onTap: () async{
                        DateTime date = DateTime(1900);
                        FocusScope.of(context).requestFocus(FocusNode());

                        date = (await showDatePicker(
                                      context: context, 
                                      initialDate:DateTime.now(),
                                      firstDate:DateTime(1900),
                                      lastDate: DateTime(2100)))!;

                        controller_age.text = "${date.day}-${date.month}-${date.year}";
                        
                        },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth';
                    }
                  return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller_height,
                  keyboardType:  const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.square_foot),
                    hintText: 'Enter height in centimeters',
                    labelText: 'Height',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                  return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: controller_weight,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.scale),
                    hintText: 'Enter weight in kilograms',
                    labelText: 'Weight',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight';
                    }
                  return null;
                  },
                ),
                Container(
                    padding: const EdgeInsets.only(top: 16),
                    alignment: Alignment.center,
                    child: ButtonTheme(
                        minWidth: 200,
                        height: 64,
                        child: OutlinedButton(
                            onPressed: () {
                                  // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.

                                  final valueName = controller_name.text;
                                  final valueAge = controller_age.text;
                                  final valueHeight = controller_height.text;
                                  final valueWeight = controller_weight.text;

                                  num bmi = num.parse(valueWeight)/(pow((num.parse(valueHeight)*0.01),2));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('BMI: ${bmi}')),
                                  );
                              }
                            },
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                   WidgetSpan(
                                    child: Icon(Icons.check, size: 16),
                                  ),
                                  TextSpan(
                                    text: " Submit",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 48, vertical: 16))))),
              ],
            ),
          ),
        )
      );
  }
}
