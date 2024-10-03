import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:guliver/enum.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddVehicles extends StatefulWidget {
  const AddVehicles({super.key});

  @override
  State<AddVehicles> createState() => _AddVehiclesState();
}

class _AddVehiclesState extends State<AddVehicles> {
  final _formKey = GlobalKey<FormState>();
  VehicleType? typeOfVehicle;
  VehicleYear? year;
  ModeOfInsurance? modeOfInsurance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _vehRegNo = TextEditingController();
  final TextEditingController _chasisNo = TextEditingController();

  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  String vehicleName = '';
  String model = '';
  String color = '';
  String registrationNumber = '';
  String chassisNumber = '';
  String value = '';

  File? _pickedImagefront;
  File? _pickedImageback;
  File? _pickedImageside;
  File? _pickedImagetop;
  File? _pickedImagelicense;
  File? _pickedImageownership;

  void _pickImagelicense(ImageSource source) async {
    // Request permissions
    if (source == ImageSource.camera) {
      final status = await Permission.camera.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    } else {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    }

    final XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _pickedImagelicense = File(pickedFile.path);
      });
    }
  }

  void _pickImageownership(ImageSource source) async {
    // Request permissions
    if (source == ImageSource.camera) {
      final status = await Permission.camera.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    } else {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    }

    final XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _pickedImageownership = File(pickedFile.path);
      });
    }
  }

  void _pickImagetop(ImageSource source) async {
    // Request permissions
    if (source == ImageSource.camera) {
      final status = await Permission.camera.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    } else {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    }

    final XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _pickedImagetop = File(pickedFile.path);
      });
    }
  }

  void _pickImageside(ImageSource source) async {
    // Request permissions
    if (source == ImageSource.camera) {
      final status = await Permission.camera.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    } else {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    }

    final XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _pickedImageside = File(pickedFile.path);
      });
    }
  }

  void _pickImageback(ImageSource source) async {
    // Request permissions
    if (source == ImageSource.camera) {
      final status = await Permission.camera.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    } else {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    }

    final XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _pickedImageback = File(pickedFile.path);
      });
    }
  }

  void _pickImagefront(ImageSource source) async {
    // Request permissions
    if (source == ImageSource.camera) {
      final status = await Permission.camera.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    } else {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    }

    final XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _pickedImagefront = File(pickedFile.path);
      });
    }
  }

  File? _selectedFile;
  String _selectedFileName = '';

  void _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
        _selectedFileName = _selectedFile!.path.split('/').last;
      });
    } else {
      print('No file selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/guliva_icon.png', // Replace with your actual image path
          height: 150,
          width: 150,
          fit: BoxFit.contain,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Vehicle',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Type of vehicle'),
                    DropdownButtonFormField<VehicleType>(
                      decoration: InputDecoration(
                        hintText: 'Type of vehicle',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: const OutlineInputBorder(),
                      ),
                      value: typeOfVehicle,
                      items: VehicleType.values
                          .map((type) => DropdownMenuItem(
                                value: type,
                                child: Text(type.toString().split('.').last),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          typeOfVehicle = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Name of vehicles'),
                    TextFormField(
                      key: const ValueKey(1),
                      onSaved: (newValue) {
                        vehicleName = newValue!;
                      },
                      onChanged: (value) {
                        vehicleName = value;
                      },
                      controller: _nameController,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'e.g Benz AL340',
                          labelStyle: TextStyle(color: Colors.grey.shade400),
                          hintStyle: TextStyle(color: Colors.grey.shade400)),
                    ),
                    const SizedBox(height: 20),
                    const Text('Model'),
                    TextFormField(
                      key: const ValueKey(2),
                      onSaved: (newValue) {
                        model = newValue!;
                      },
                      onChanged: (value) {
                        model = value;
                      },
                      controller: _modelController,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'e.g AL340',
                          labelStyle: TextStyle(color: Colors.grey.shade400),
                          hintStyle: TextStyle(color: Colors.grey.shade400)),
                    ),
                    const SizedBox(height: 20),
                    const Text('Color'),
                    TextFormField(
                      key: const ValueKey(3),
                      onSaved: (newValue) {
                        color = newValue!;
                      },
                      onChanged: (value) {
                        color = value;
                      },
                      controller: _colorController,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'e.g black',
                          labelStyle: TextStyle(color: Colors.grey.shade400),
                          hintStyle: TextStyle(color: Colors.grey.shade400)),
                    ),
                    const SizedBox(height: 20),
                    const Text('Year'),
                    DropdownButtonFormField<VehicleYear>(
                      decoration: InputDecoration(
                        hintText: 'Year',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: const OutlineInputBorder(),
                      ),
                      value: year,
                      items: VehicleYear.values
                          .map((year) => DropdownMenuItem(
                                value: year,
                                child: Text(year
                                    .toString()
                                    .split('.')
                                    .last
                                    .replaceAll('year', '')),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          year = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Value of Vehicle'),
                    TextFormField(
                      key: const ValueKey(6),
                      onSaved: (newValue) {
                        value = newValue!;
                      },
                      onChanged: (value) {
                        value = value;
                      },
                      keyboardType: TextInputType.number,
                      controller: _valueController,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'N',
                          labelStyle: TextStyle(color: Colors.grey.shade400),
                          hintStyle: TextStyle(color: Colors.grey.shade400)),
                    ),
                    const SizedBox(height: 20),
                    const Text('Vehicle registration no.'),
                    TextFormField(
                      key: const ValueKey(4),
                      onSaved: (newValue) {
                        registrationNumber = newValue!;
                      },
                      onChanged: (value) {
                        registrationNumber = value;
                      },
                      keyboardType: TextInputType.number,
                      controller: _vehRegNo,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'e.g KTU34NN',
                          labelStyle: TextStyle(color: Colors.grey.shade400),
                          hintStyle: TextStyle(color: Colors.grey.shade400)),
                    ),
                    const SizedBox(height: 20),
                    const Text('Chasis No.'),
                    TextFormField(
                      key: const ValueKey(5),
                      onChanged: (value) {
                        chassisNumber = value;
                      },
                      onSaved: (newValue) {
                        chassisNumber = newValue!;
                      },
                      keyboardType: TextInputType.number,
                      controller: _chasisNo,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'e.g KTU34NN',
                          labelStyle: TextStyle(color: Colors.grey.shade400),
                          hintStyle: TextStyle(color: Colors.grey.shade400)),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                        'Mode of insurance'), // Add spacing between dropdowns
                    DropdownButtonFormField<ModeOfInsurance>(
                      decoration: InputDecoration(
                        hintText: 'Mode of Insurance',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: const OutlineInputBorder(),
                      ),
                      value: modeOfInsurance,
                      items: ModeOfInsurance.values
                          .map((mode) => DropdownMenuItem(
                                value: mode,
                                child: Text(mode
                                    .description), // Using the extension for description
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          modeOfInsurance = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Front View',
                                style: TextStyle(fontSize: 14)),
                            const SizedBox(height: 8),
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                border: Border.all(
                                  color: const Color.fromARGB(255, 100, 97, 97),
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: _pickedImagefront != null
                                  ? Image.file(
                                      _pickedImagefront!,
                                      fit: BoxFit.cover,
                                    ) // Display the selected image
                                  : IconButton(
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey.shade600,
                                      ),
                                      onPressed: () {
                                        _pickImagefront(ImageSource.camera);
                                      },
                                    ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Back View',
                                style: TextStyle(fontSize: 14)),
                            const SizedBox(height: 8),
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 100, 97, 97),
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: _pickedImageback != null
                                  ? Image.file(
                                      _pickedImageback!,
                                      fit: BoxFit.cover,
                                    ) // Display the selected image
                                  : IconButton(
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey.shade600,
                                      ),
                                      onPressed: () {
                                        _pickImageback(ImageSource.camera);
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Side view',
                                style: TextStyle(fontSize: 14)),
                            const SizedBox(height: 8),
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 100, 97, 97),
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: _pickedImageside != null
                                  ? Image.file(
                                      _pickedImageside!,
                                      fit: BoxFit.cover,
                                    ) // Display the selected image
                                  : IconButton(
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey.shade600,
                                      ),
                                      onPressed: () {
                                        _pickImageside(ImageSource.camera);
                                      },
                                    ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Top View',
                                style: TextStyle(fontSize: 14)),
                            const SizedBox(height: 8),
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 100, 97, 97),
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: _pickedImagetop != null
                                  ? Image.file(
                                      _pickedImagetop!,
                                      fit: BoxFit.cover,
                                    ) // Display the selected image
                                  : IconButton(
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey.shade600,
                                      ),
                                      onPressed: () {
                                        _pickImagetop(ImageSource.camera);
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Text(
                      'Upload 3rd party insurance certificate if you already have a cover',
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade300),
                          child: Center(
                            child: _selectedFile != null
                                ? Center(
                                    child: Text(
                                      _selectedFileName,
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  )
                                : TextButton(
                                    onPressed: _selectFile,
                                    child: const Text(
                                      'upload File (DOC, PDF)',
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Text(
                      "Upload driver's license",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade300),
                          child: Center(
                              child: _pickedImagelicense != null
                                  ? Image.file(
                                      _pickedImagelicense!,
                                      fit: BoxFit.fill,
                                      width: 300,
                                    ) // Display the selected image
                                  : TextButton(
                                      onPressed: () {
                                        _pickImagelicense(ImageSource.gallery);
                                      },
                                      child: const Text(
                                        'upload image',
                                      ),
                                    )),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Text(
                      "Upload proof of ownership",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade300),
                          child: Center(
                            child: _pickedImageownership != null
                                ? Image.file(
                                    _pickedImageownership!,
                                    fit: BoxFit.fill,
                                    width: 300,
                                  ) // Display the selected image
                                : TextButton(
                                    onPressed: () {
                                      _pickImageownership(ImageSource.gallery);
                                    },
                                    child: const Text('upload image'),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue, // Text color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16), // Padding
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                          elevation: 5, // Elevation (shadow)
                        ),
                        child: const Text('CONTINUE'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
