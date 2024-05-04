import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  List<Map<String, String>> medicineList = [];
  List<Map<String, String>> filteredMedicineList = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredMedicineList = medicineList;
  }

  void _addMedicine(BuildContext context) {
    String medicineName = '';
    String bilanNeeded = '';
    String medicineInfo = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Medicine'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    medicineName = value;
                  },
                  decoration: InputDecoration(labelText: 'Medicine Name'),
                ),
                TextField(
                  onChanged: (value) {
                    bilanNeeded = value;
                  },
                  decoration: InputDecoration(labelText: 'Bilan Needed'),
                ),
                TextField(
                  onChanged: (value) {
                    medicineInfo = value;
                  },
                  decoration:
                      InputDecoration(labelText: 'Medicine Information'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  medicineList.add({
                    'name': medicineName,
                    'bilan': bilanNeeded,
                    'info': medicineInfo,
                  });
                  filteredMedicineList = medicineList; // Update filtered list
                });
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _showMedicineDetails(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Medicine Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Medicine Name: ${medicineList[index]['name']}'),
              Text('Bilan Needed: ${medicineList[index]['bilan']}'),
              Text('Medicine Information: ${medicineList[index]['info']}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _deleteMedicine(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this medicine?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  medicineList.removeAt(index);
                  filteredMedicineList = medicineList; // Update filtered list
                });
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _filterMedicines(String query) {
    setState(() {
      filteredMedicineList = medicineList
          .where((medicine) =>
              medicine['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medicine List',
          style: GoogleFonts.robotoSerif(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: searchController,
                onChanged: _filterMedicines,
                decoration: InputDecoration(
                  labelText: 'Search a Medicine',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMedicineList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    _showMedicineDetails(context, index);
                  },
                  title: Text(filteredMedicineList[index]['name']!),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteMedicine(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addMedicine(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Medicine(),
  ));
}
