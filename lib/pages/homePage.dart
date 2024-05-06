import 'package:flutter/material.dart';
import 'package:health_paw2/pages/petPage.dart';
import 'package:health_paw2/src/newPet_form.dart';
import 'package:health_paw2/src/pet_profile_data.dart';


class PetProfilesPage extends StatefulWidget {
  @override
  _PetProfilesPageState createState() => _PetProfilesPageState();
}

class _PetProfilesPageState extends State<PetProfilesPage> {
  List<PetProfile> petProfiles = []; // Profile Lists

  void _addNewPetProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPetForm()),
    );
    if (result != null) {
      setState(() {
        petProfiles.add(result); // add new profile the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text('Evcil Dostlarım'),
        backgroundColor: Color.fromRGBO(255, 0, 5, 0.8),
        elevation: 0,
        leading: Icon(Icons.menu),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/paw1.png'),
            fit: BoxFit.fitHeight,
            opacity: 0.35
            ),
          ),
        child: Column(
          
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: petProfiles.length,
                itemBuilder: (context, index) {
                  PetProfile profile = petProfiles[index];
                  return ListTile(
                    title: Text(profile.name),
                    subtitle: Text('Doğum Yeri: ${profile.birthPlace}'),
                    onTap: () {
                      // Profile detail page route
                      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PetPage(pageTitle: '',)));
                    },
                  );
                },
              ),
            ),
            Padding(
  padding: const EdgeInsets.all(35.0),
  child: Container(
    child: ElevatedButton(
      onPressed: _addNewPetProfile,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), 
        ), 
        shadowColor: Colors.transparent, 
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(255, 0, 5, 1), Color.fromRGBO(255, 187, 0, 0.6)], 
            begin: Alignment.topLeft, 
            end: Alignment.bottomRight, 
          ),
          borderRadius: BorderRadius.circular(8), 
        ),
        child: Container(
          alignment: Alignment.center,
          height: 52.0, 
          child: Text(
            'Yeni bir evcil dostum var!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white, 
            ),
          ),
        ),
      ),
    ),
  ),
),
SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}