import 'package:assesment/screens/display_screen.dart';
import 'package:flutter/material.dart';

class DynamicEditTextScreen extends StatefulWidget {
  @override
  _DynamicEditTextScreenState createState() => _DynamicEditTextScreenState();
}

class _DynamicEditTextScreenState extends State<DynamicEditTextScreen> {
  List<String> editTextValues = [];

  void _addEditText() {
    setState(() {
      controllers.add(TextEditingController());
      editTextValues.add('');
    });
  }

  void _deleteEditText(int index) {
    setState(() {
      controllers.removeAt(index);
      editTextValues.removeAt(index);
    });
  }

  void _saveValuesAndNavigate(BuildContext context) {
    if(editTextValues.isNotEmpty) {
      if (editTextValues.any((element) => element.isEmpty)) {
        var snackBar = const SnackBar(
            content: Text('Please Fill all text fields or delete it'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DisplayScreen(editTextValues),
          ),
        );
      }
    }else{
      var snackBar = const SnackBar(
          content: Text('Add one or more text field'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  List<TextEditingController> controllers=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for(TextEditingController controller in controllers){
      controller.dispose();
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: editTextValues.isEmpty?Center(child: Text('There is no textfield add from below button',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),):ListView.builder(
                itemCount: editTextValues.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Enter text',
                              ),
                              controller: controllers[index],
                              onChanged: (value) {
                                setState(() {
                                  controllers[index].text = value;
                                  editTextValues[index] = value;
                                });
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _deleteEditText(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _addEditText,
              child: const Text('Add'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _saveValuesAndNavigate(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}