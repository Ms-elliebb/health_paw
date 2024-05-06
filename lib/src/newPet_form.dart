import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        backgroundColor: Color.fromRGBO(255, 0, 5, 0.8),
        elevation: 0,
        
            title: Text('Yeni Evcil Dost Ekle'),
          ),
          
          body: Container(
            
            decoration: BoxDecoration(
              
              image: DecorationImage(
                image: AssetImage('lib/images/paw1.png'),
                fit: BoxFit.fitHeight,
                opacity: 0.35
                ),
              ),
            child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(8.0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:Color.fromRGBO(255, 0, 5, 0.1),
                            blurRadius: 10.0,
                            offset: Offset(0,10),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10)
                        
                        
                        ),
                      child: TextFormField(
                        
                        controller: nameController,
                        decoration: InputDecoration(hintText: '  Adı',hintStyle: TextStyle(color: Colors.grey[400]),border: InputBorder.none),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen evcil dostunuzun adını giriniz';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 60,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:Color.fromRGBO(255, 0, 5, 0.1),
                            blurRadius: 10.0,
                            offset: Offset(0,10),
                          )
                        ],
                    ),
                    child: ListTile(
                      
                      
                      style: ListTileStyle.list,
                      title: Text(birthDate == null ? 'Doğum Tarihi Seçin' : 'Doğum Tarihi: ${DateFormat('yyyy-MM-dd').format(birthDate!)}'),
                      onTap: _presentDatePicker,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:Color.fromRGBO(255, 0, 5, 0.1),
                            blurRadius: 10.0,
                            offset: Offset(0,10),
                          )
                        ],
                        
                       
                     ),
                      child: TextFormField(
                        controller: birthPlaceController,
                        decoration: InputDecoration(hintText: '  Doğum Yeri',hintStyle: TextStyle(color: Colors.grey[400]),border: InputBorder.none),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen doğum yerini giriniz';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:Color.fromRGBO(255, 0, 5, 0.1),
                            blurRadius: 10.0,
                            offset: Offset(0,10),
                          )
                        ],
                        
                        ),
                      child: TextFormField(
                        controller: ownerEmailController,
                        decoration: InputDecoration(hintText: '  Sahibinin E-postası',hintStyle: TextStyle(color: Colors.grey[400]),border: InputBorder.none),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen sahibinin e-posta adresini giriniz';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:Color.fromRGBO(255, 0, 5, 0.1),
                            blurRadius: 10.0,
                            offset: Offset(0,10),
                          )
                        ],
                        
                      
                      ),
                      child: TextFormField(
                        controller: ownerNameController,
                        decoration: InputDecoration(
                          hintText: '  Sahibinin Adı',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: InputBorder.none,
                          ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen sahibinin adını giriniz';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
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
                      
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero, // Container'ın gradyanını kapsamasını sağlar
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Düğme kenarlarını yuvarlak yapar
                        ),
                      ),
                      
                        child: Ink(
                          
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromRGBO(255, 0, 5, 1), Color.fromRGBO(255, 187, 0, 0.6)], // Gradyan renkleri
                              begin: Alignment.topLeft, // Gradyanın başlangıç noktası
                              end: Alignment.bottomRight, // Gradyanın bitiş noktası
                            ),
                            borderRadius: BorderRadius.circular(8), // Container kenarlarını yuvarlak yapar
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: 52.0,
                            
                             // Örneğin yüksekliği
                            child: Text('Kaydet',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                  ),]
            )
            
                
                  ),
          )
              
            
          
        );
      
    
  }
}

