import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // DateFormat için intl paketini eklemeyi unutmayın
import 'package:health_paw2/src/pet_profile_data.dart';

class NewPetForm extends StatefulWidget {
  const NewPetForm({super.key});

  @override
  State<NewPetForm> createState() => _NewPetFormState();
}

class _NewPetFormState extends State<NewPetForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  DateTime? birthDate;  // Doğum tarihini tutacak değişken
  final birthPlaceController = TextEditingController();
  final ownerEmailController = TextEditingController();
  final ownerNameController = TextEditingController();

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        birthDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Evcil Dost Ekle'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Adı'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen evcil dostunuzun adını giriniz';
                }
                return null;
              },
            ),
            ListTile(
              title: Text(birthDate == null ? 'Doğum Tarihi Seçin' : 'Doğum Tarihi: ${DateFormat('yyyy-MM-dd').format(birthDate!)}'),
              onTap: _presentDatePicker,
            ),
            TextFormField(
              controller: birthPlaceController,
              decoration: InputDecoration(labelText: 'Doğum Yeri'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen doğum yerini giriniz';
                }
                return null;
              },
            ),
            TextFormField(
              controller: ownerEmailController,
              decoration: InputDecoration(labelText: 'Sahibinin E-postası'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen sahibinin e-posta adresini giriniz';
                }
                return null;
              },
            ),
            TextFormField(
              controller: ownerNameController,
              decoration: InputDecoration(labelText: 'Sahibinin Adı'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen sahibinin adını giriniz';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() && birthDate != null) {
                  PetProfile newPet = PetProfile(
                    name: nameController.text,
                    birthDate: birthDate!,
                    birthPlace: birthPlaceController.text,
                    ownerEmail: ownerEmailController.text,
                    ownerName: ownerNameController.text,
                  );
                  Navigator.pop(context, newPet);
                } else {
                  // Doğum tarihi seçilmemişse uyarı göster
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Lütfen bir doğum tarihi seçiniz')),
                  );
                }
              },
              child: Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}

