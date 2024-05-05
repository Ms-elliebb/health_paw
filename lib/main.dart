import 'package:flutter/material.dart';
import 'package:health_paw2/pages/petPage.dart';
import 'package:health_paw2/src/newPet_form.dart';
import 'package:health_paw2/src/pet_profile_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evcil Dostlarım',
      home: PetProfilesPage(),
    );
  }
}

class PetProfilesPage extends StatefulWidget {
  @override
  _PetProfilesPageState createState() => _PetProfilesPageState();
}

class _PetProfilesPageState extends State<PetProfilesPage> {
  List<PetProfile> petProfiles = []; // Profil Listesi

  void _addNewPetProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPetForm()),
    );
    if (result != null) {
      setState(() {
        petProfiles.add(result); // yeni profili listeye ekle
      });
    }
  }

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
      body: Column(
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
                    // Profil detay sayfasına geçiş yap
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: ElevatedButton(
              onPressed: _addNewPetProfile,
              child: Text(
                'Yeni bir evcil dostum var!',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(255, 0, 5, 0.8),
                padding: EdgeInsets.all(15.0),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



