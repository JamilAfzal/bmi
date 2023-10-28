// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, use_function_type_syntax_for_parameters, unrelated_type_equality_checks, unused_local_variable

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var wtcontroller = TextEditingController();
  var htcontroller = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 11, 7, 1),
              boxShadow: [BoxShadow(blurRadius: 20.0)],
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 130.0)),
            ),
            child: Center(
                child: Text(
              "BMI",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(height: 80),
          Container(
            width: 250,
            child: TextField(
              controller: wtcontroller,
              decoration: InputDecoration(
                  label: Text("Enter Your Weight"),
                  prefixIcon: Icon(
                    Icons.line_weight_outlined,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.8))),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 250,
            child: TextField(
              controller: htcontroller,
              decoration: InputDecoration(
                  label: Text("Enter Your height in Feets"),
                  prefixIcon: Icon(
                    Icons.height_outlined,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.8))),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                var wt = wtcontroller.text.toString();
                var ht = htcontroller.text.toString();

                if (wt != "" && ht != "") {
                  var iwt = int.parse(wt);
                  var iht = int.parse(ht);
                  var iheight = iht * 2.54;
                  var tM = iheight / 100;
                  var bmi = iwt / tM;
                  setState(() {
                    result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                  });
                } else {
                  setState(() {
                    result = "Please fill all the fields";
                  });
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black)),
              child: Container(
                  width: 150,
                  height: 50,
                  child: Row(
                    children: [
                      Icon(Icons.calculate_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Calculate")
                    ],
                  ))),
          SizedBox(
            height: 25,
          ),
          Text(result,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ))
        ]),
      ),
    );
  }
}
