import 'package:flutter/material.dart';
import 'package:health_paw2/pages/petPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evcil Dostlarım',
      home: PetProfilePage(),
    );
  }
}

class PetProfilePage extends StatelessWidget {
  final String buttonText="Köpük";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 229, 230, 0.9),
      appBar: AppBar(
        title: Text('Evcil Dostlarım'),
        backgroundColor: Color.fromRGBO(255, 0, 5, 0.8),
        elevation: 0,
        leading: Icon(Icons.menu),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 20),  // Spacer
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: CircleAvatar(
                      
                      radius: 55,
                      
                      backgroundImage:AssetImage('lib/images/kopuk.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PetPage(pageTitle: buttonText)),
                        );

                    }, 
                    child: Text('Köpük',style: TextStyle(color: Colors.black,fontSize: 20,),),
                    style: ElevatedButton.styleFrom(
                    side: BorderSide(style: BorderStyle.none,),  
                    shadowColor: Colors.black87,  
                    backgroundColor: Color.fromRGBO(255, 0, 5, 0.8),
                    padding: EdgeInsets.symmetric(horizontal: 105,vertical: 20),
                                   
                                        
                    ),),
                  )
                ],
              ),
            ),
            
            Spacer(),  // Takes all available space
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Yeni bir evcil dostum var!',style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 0, 5, 0.8),
                  padding: EdgeInsets.all(15.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

