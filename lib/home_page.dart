import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

enum Service {NoneSpeficied(0.0), Amazing(0.2), Good(0.18), Okay(0.15); const Service(this.value); final double value;}

class _HomePageState extends State<HomePage> {
  // TODO: completar todo lo necesario

  Service val = Service.NoneSpeficied;
  double tipAmount = 0;
  double costOfService = 100;
  bool roundUp = false;
  bool validCostOfService = true;
  final textCostOfService = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
        backgroundColor: Colors.green[700],
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service, color: Colors.green[700],),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                keyboardType: TextInputType.phone, 
                controller: textCostOfService,                               
                decoration: InputDecoration(                
                  labelText: "Cost of service",
                  labelStyle: TextStyle(color: Colors.green[700]),
                  errorText: !validCostOfService? "Value cannot be empty" : null,
                  border: OutlineInputBorder(),  
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[700]!, width: 2.0)),               
              ),),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining, color: Colors.green[700]),
            title: Text("How was the service?"),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 50.0),
            leading: Radio(value: Service.Amazing, groupValue: val, onChanged: (value) {
              val = Service.Amazing;
              setState(() {
                
              });
            },
            ),
            title: Text("Amazing (20%)")            
          ),

          ListTile(
            contentPadding: EdgeInsets.only(left: 50.0),
            leading: Radio(value: Service.Good, groupValue: val, onChanged: (value) {
              val = Service.Good;
              setState(() {
                
              });
            },
            ),
            title: Text("Good (18%)")            
          ),

          ListTile(
            contentPadding: EdgeInsets.only(left: 50.0),
            leading: Radio(value: Service.Okay, groupValue: val, onChanged: (value) {
              val = Service.Okay;
              setState(() {
               
              });
            },
            ),
            title: Text("Okay (15%)")            
          ),
          
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.green[700]),
            title: Text("Round up tip"),
            trailing: Switch(activeColor: Colors.green[700],
            value: roundUp,
            onChanged: (value) {
              setState(() {
                roundUp = value;
              });
            },),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
            child: MaterialButton(
              child: Text("CALCULATE"),
              onPressed: _tipCalculation,
              color: Colors.green[700], 
              
                         
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.centerRight, child: Text("Tip amount: \$${tipAmount.toStringAsFixed(2)}")),
          ),
        ],
      ),
    );
  }


  void _tipCalculation() {
    
    setState(() {

      if(textCostOfService.text.isEmpty){
        print("Its empty");
        validCostOfService = false;
      } else {
        validCostOfService = true;
      }

      if(validCostOfService)
      {
        costOfService = double.parse(textCostOfService.text);
        if(roundUp)
          tipAmount = (costOfService * val.value).ceil().toDouble();
        else
          tipAmount = costOfService * val.value;
      }
      

      
      
      print("${tipAmount} = ${costOfService} * ${val.value}");
    });

  }
}