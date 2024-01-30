import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
        useMaterial3: true,
      ),
      home: const Clothes(),
    );
  }
}

class Clothes extends StatefulWidget {
  const Clothes({Key? key}) : super(key: key);

  @override
  _ClothesState createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  List<String> clothes = ["Dzemper", "Pantaloni", "Kosula", "Maica", "Kapa", "Sorcevi", "Patiki"];

  void addClothes() {
    String newCloth = "";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Clothes", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
          content: TextField(
            onChanged: (value) {
              newCloth = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter cloth name',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (newCloth.isNotEmpty) {
                    clothes.add(newCloth);
                  }
                  Navigator.pop(context);
                });
              },
              child: const Text("Add", style: TextStyle(color: Colors.red)),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            )
          ],
        );
      },
    );
  }

  void deleteClothes(int index) {
    setState(() {
      clothes.removeAt(index);
    });
  }

  void editClothes(int index) {
    String editedCloth = clothes[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Clothes", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
          content: TextField(
            onChanged: (value) {
              editedCloth = value;
            },
            decoration: InputDecoration(
              hintText: 'Edit cloth name',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  clothes[index] = editedCloth;
                  Navigator.pop(context);
                });
              },
              child: const Text("Save", style: TextStyle(color: Colors.red)),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clothes', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                clothes[index],
                style: const TextStyle(fontSize: 18),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.red),
                    onPressed: () {
                      editClothes(index);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_rounded, color: Colors.red),
                    onPressed: () {
                      deleteClothes(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addClothes,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
