import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class Profile {
  final String name;
  final String sex;
  final String age;
  final String height;
  final String weight;
  final String activity;

  Profile(this.name, this.sex, this.age, this.height, this.weight, this.activity);
}
class MyCustomFormState extends State<MyCustomForm> {
  
  final _formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerSex;
  late TextEditingController controllerAge;
  late TextEditingController controllerHeight;
  late TextEditingController controllerWeight;
  late TextEditingController controllerActivity;
  
  String name = '';
  String sex = '';
  String age = '';
  String height = '';
  String weight = '';
  String activity = '';
  String bmi = '';
  String calories = '';
  String proteins = '';
  String fruits = '';
  String vegetables = '';
  String grains = '';
  String dairy = '';

  @override
  void initState() {
    super.initState();
    controllerName = TextEditingController();
    controllerSex = TextEditingController();
    controllerAge = TextEditingController();
    controllerHeight = TextEditingController();
    controllerWeight = TextEditingController();
    controllerActivity = TextEditingController();
  }
  @override
  void dispose() {
  controllerName.dispose();
  controllerSex.dispose();
  controllerAge.dispose();
  controllerHeight.dispose();
  controllerWeight.dispose();
  controllerActivity.dispose();
  super.dispose();
  }

  Future openDialog() => showDialog<Profile>(
      context: context,
      builder: (context) => AlertDialog(
      title: Text('Profile Details'),
      content: Column(
        children: [
          TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Enter your Name', labelText: 'Name'),
            controller: controllerName,
          ),
          TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'F for female | M for male', labelText: 'Sex at Birth'),
            controller: controllerSex,
          ),
          TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Enter your Date of Birth', labelText: 'Date of Birth',),
            controller: controllerAge,
            
            onTap: () async {
              DateTime date = DateTime(1900);
              FocusScope.of(context).requestFocus(FocusNode());

              date = (await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100)))!;

              controllerAge.text =
                  "${date.day}-${date.month}-${date.year}";
            },
          ),
          TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Enter height in centimeters',labelText: 'Height',),
            controller: controllerHeight,

          ),
          TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Enter weight in kilograms', labelText: 'Weight',),
            controller: controllerWeight,
          ),
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: '1 to 4 | 4 - highest level of activity',
              labelText: 'Rate your Activity Level',),
            controller: controllerActivity,
          ),
      ]),
      actions: [
        TextButton (
          child: Text('Done'),
          onPressed: submit,
        ),
      ],),
  );

  void submit() {
    Profile user = new Profile(controllerName.text, controllerSex.text, controllerAge.text, controllerHeight.text, controllerWeight.text, controllerActivity.text);
    Navigator.of(context).pop(user);
  }


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Your Profile"),
                    const SizedBox(height: 8),
                    TextFormField(
                      enabled: false,
                      controller: controllerName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Name',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      enabled: false,
                      controller: controllerSex,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.rice_bowl),
                        labelText: 'Sex at Birth',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      enabled: false,
                      controller: controllerAge,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.cake),
                          labelText: "Date of Birth"),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      enabled: false,
                      controller: controllerHeight,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.square_foot),
                        labelText: 'Height',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      enabled: false,
                      controller: controllerWeight,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.scale),
                        labelText: 'Weight',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      enabled: false,
                      controller: controllerActivity,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.accessibility_new_rounded),
                        labelText: 'Your Activity Level',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || int.parse(value) <1 || int.parse(value) >4) {
                          return 'Please enter a digit from 1 to 4';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                        child: Text( 'Edit Profile'),
                        onPressed: () async {
                          Profile user = await openDialog();

                          
                          if (!(user.name == null) != null && user.name.isNotEmpty)  {
                            setState(() => this.name = user.name);
                          } else {
                            return;
                          }
                          if (user.sex == "F" || user.sex == "M")  {                       
                            setState(() => this.sex = user.sex);
                          } else {
                            return;
                          }
                          if (!(user.age == null) && user.age.isNotEmpty)  {
                            setState(() => this.age = user.age);
                          } else {
                            return;
                          }
                          if (!(user.height == null) && user.height.isNotEmpty)  {
                            setState(() => this.height = user.height);
                          } else {return;}
                          if (!(user.weight == null) && user.weight.isNotEmpty)  {
                            setState(() => this.weight = user.weight);
                          } else {return;}
                          if (!(user.activity == null) && user.activity.isNotEmpty && num.parse(user.activity)>0 && num.parse(user.activity)<5)  {
                            String active = "";
                            switch(user.activity){
                              case "1":{
                                active = "Very Low (Couch potato)";
                                break;
                                }
                              case "2":{
                                active = "Low (Seldom walks distances, no sports)";
                                break;
                                }
                              case "3":{
                                active = "Active (Casual sports, distance walking)";
                                break;
                                }
                              case "4":{
                                active = "Very Active (athlete)";
                                break;
                                }
                            }
                            print(active);
                            setState(() => this.activity = active);
                          }

                          //BMI CALCULATOR + DESCRIPTION
                          num bmi_calc = num.parse(this.weight)/(pow((num.parse(this.height) * 0.01), 2));
                          String bmi = bmi_calc.toStringAsFixed(2);
                          String bmi_desc = "";
                          if (num.parse(bmi) < 19) bmi_desc = "Underweight";
                          else if (num.parse(bmi) < 25) bmi_desc = "Healthy";
                          else if (num.parse(bmi) < 30) bmi_desc = "Overweight";
                          else bmi_desc = "Obese";
                          setState(() => this.bmi = bmi+ " ("+ bmi_desc+")");

                          //CALORIE CALCULATOR
                          num calories = 0;
                          switch (bmi_desc){
                            case "Underweight": calories = calories + 200; break;
                            case "Overweight": calories = calories - 50; break;
                            case "Obese": calories = calories - 100; break;
                          }
                          switch (user.activity){
                            case "1": calories = calories - 100; break;
                            case "2": calories = calories - 50; break;
                            case "3": calories = calories + 50; break;
                            case "4": calories = calories + 150; break;
                          }
                          String birthyear = user.age.substring(user.age.length - 4);
                          
                          DateTime now = DateTime.now();
                          DateFormat formatter = DateFormat('yyyy');
                          String formatted = formatter.format(now);

                          int age = int.parse(formatted) - int.parse(birthyear);

                          String proteins =" ounces";
                          String fruits =" cups";
                          String vegetables =" cups";
                          String grains = " ounces";
                          String dairy =" cups";

                          if(user.sex == "M"){
                            switch(age){
                              case 2: case 3: case 4: {
                                calories = calories + 1300; 
                                proteins = "2 to 5" + proteins;
                                fruits = "1 to 1.5" + fruits;
                                vegetables = "1 to 2" + vegetables;
                                grains = "3 to 5" + grains;
                                dairy = "2 to 2.5" + dairy;
                                break;
                              }
                              case 5: case 6: case 7: case 8: {
                                calories = calories + 1600; 
                                proteins = "3 to 5.5" + proteins;
                                fruits = "1 to 2" + fruits;
                                vegetables = "1.5 to 2.5" + vegetables;
                                grains = "4 to 6" + grains;
                                dairy = "2.5" + dairy;
                                break;
                              }
                              case 9: case 10: case 11: case 12: case 13: {
                                calories = calories + 2100; 
                                proteins = "5 to 6.5" + proteins;
                                fruits = "1.5 to 2" + fruits;
                                vegetables = "2 to 3.5" + vegetables;
                                grains = "5 to 9" + grains;
                                dairy = "3" + dairy;
                                break;
                              }
                              default: {
                                calories = calories + 2100; 
                                proteins = "5.5 to 7" + proteins;
                                fruits = "2 to 2.5" + fruits;
                                vegetables = "2.5 to 4" + vegetables;
                                grains = "6 to 10" + grains;
                                dairy = "3" + dairy;
                                break;
                              }
                            }

                          } else {
                            switch(age){
                              case 2: case 3: case 4: {
                                calories = calories + 1200; 
                                proteins = "2 to 4" + proteins;
                                fruits = "1 to 1.5" + fruits;
                                vegetables = "1 to 1.5" + vegetables;
                                grains = "3 to 5" + grains;
                                dairy = "2 to 2.5" + dairy;
                                break;
                                }
                              case 5: case 6: case 7: case 8: {
                                calories = calories + 1500; 
                                proteins = "3 to 5" + proteins;
                                fruits = "1 to 1.5" + fruits;
                                vegetables = "1.5 to 2.5" + vegetables;
                                grains = "4 to 6" + grains;
                                dairy = "2.5" + dairy;
                                break;
                              }
                              case 9: case 10: case 11: case 12: case 13: {
                                calories = calories + 1800; 
                                proteins = "4 to 6" + proteins;
                                fruits = "1.5 to 2" + fruits;
                                vegetables = "1.5 to 3" + vegetables;
                                grains = "5 to 7" + grains;
                                dairy = "3" + dairy;
                                break;
                              }
                              default: {
                                calories = calories + 2100; 
                                proteins = "5 to 6.5" + proteins;
                                fruits = "1.5 to 2" + fruits;
                                vegetables = "2.5 to 3" + vegetables;
                                grains = "6 to 8" + grains;
                                dairy = "3" + dairy;
                                break;
                              }
                            }
                          }
                          setState(() => this.calories = calories.toString());
                          setState(() => this.proteins = proteins);
                          setState(() => this.fruits = fruits);
                          setState(() => this.vegetables = vegetables);
                          setState(() => this.grains = grains);
                          setState(() => this.dairy = dairy);
                          },
                        ),
                    const SizedBox(height: 12),
                    Text('BMI: $bmi'),
                    Text('Activity Level: $activity'),
                    const SizedBox(height: 12),
                    Text('Recommended Daily Nutrition Plan'),

                    Text('Daily Calorie Intake: $calories'),
                    Text('Proteins: $proteins'),
                    Text('Fruits: $fruits'),
                    Text('Vegetables: $vegetables'),
                    Text('Grains: $grains'),
                    Text('Dairy: $dairy'),
                  ],
                )
          )
        )
    )
    );
  }
}
