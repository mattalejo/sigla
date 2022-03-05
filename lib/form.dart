import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

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

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      hintText: "MM/DD/YYYY",
                      labelText: "Enter Date"),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.square_foot),
                    hintText: 'Enter height in centimeters',
                    labelText: 'Height',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.scale),
                    hintText: 'Enter weight in kilograms',
                    labelText: 'Weight',
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 16),
                    alignment: Alignment.center,
                    child: ButtonTheme(
                        minWidth: 200,
                        height: 64,
                        child: new OutlinedButton(
                            onPressed: () {},
                            child: new RichText(
                              text: TextSpan(
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 48, vertical: 16))))),
              ],
            ),
          ),
        ));
  }
}
