import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guliver/vehicle_screen.dart';
import 'package:http/http.dart' as http;

import 'package:guliver/signupcall';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isAgreedToTerms = false;
  bool isPasswordObscured = true;
  String email = '';
  String firstName = '';
  String lastName = '';
  String phoneNo = '';
  String dob = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .unfocus(); // Unfocus all text fields when tapping outside
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Social sign up buttons
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'SIGN UP WITH',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.g_mobiledata),
                              label: const Text('GOOGLE'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                side: BorderSide(color: Colors.grey[300]!),
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.facebook),
                              label: const Text('FACEBOOK'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                side: BorderSide(color: Colors.grey[300]!),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: Text(
                      'SIGN UP WITH EMAIL ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // First Name
                  TextFormField(
                    key: const ValueKey(1),
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      firstName = value;
                    },
                    onSaved: (newValue) {
                      firstName = newValue!;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Last Name
                  TextFormField(
                    key: const ValueKey(2),
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      labelText: "Last Name",
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (newValue) {
                      lastName = newValue!;
                    },
                    onChanged: (value) {
                      lastName = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Phone Number
                  TextFormField(
                    key: const ValueKey(3),
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    onSaved: (newValue) {
                      phoneNo = newValue!;
                    },
                    onChanged: (value) {
                      phoneNo = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Email
                  TextFormField(
                    key: const ValueKey(4),
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      email = value;
                    },
                    onSaved: (newValue) {
                      email = newValue!;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Date of Birth
                  TextFormField(
                    key: const ValueKey(5),
                    controller: dateOfBirthController,
                    decoration: const InputDecoration(
                      labelText: "Date of Birth",
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (newValue) {
                      dob = newValue!;
                    },
                    onChanged: (value) {
                      dob = value;
                    },
                    onTap: () async {
                      FocusScope.of(context)
                          .requestFocus(FocusNode()); // Dismiss the keyboard
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          dateOfBirthController.text =
                              pickedDate.toString().split(' ')[0];
                        });
                      } else {
                        setState(() {
                          dateOfBirthController
                              .clear(); // Clear the text if no date is picked
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password
                  TextFormField(
                    key: const ValueKey(6),
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordObscured
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordObscured = !isPasswordObscured;
                          });
                        },
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    obscureText: isPasswordObscured,
                    onChanged: (value) {
                      password = value;
                    },
                    onSaved: (newValue) {
                      password = newValue!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Terms & Conditions Checkbox
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isAgreedToTerms,
                        visualDensity: VisualDensity
                            .compact, // Adjust space around the checkbox
                        onChanged: (bool? newValue) {
                          setState(() {
                            isAgreedToTerms = newValue ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Text(
                              'I agree to the ',
                              style: TextStyle(fontSize: 10),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigate to terms and conditions
                              },
                              child: const Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Text(
                              ' and ',
                              style: TextStyle(fontSize: 10),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigate to privacy policy
                              },
                              child: const Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Sign Up Button
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!isAgreedToTerms) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please agree to the terms and conditions'),
                              ),
                            );
                            return;
                          }

                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _signUp();

                            // Call sign-up function
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15.0),
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Already have an account
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          // Navigate to login page
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    // if (!isAgreedToTerms) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("You must agree to the Terms & Conditions")),
    //   );
    //   return;
    // }

    try {
      await signUp(
        firstNameController.text,
        lastNameController.text,
        phoneNumberController.text,
        emailController.text,
        dateOfBirthController.text,
        passwordController.text,
      );
      {
        const String apiUrl = "https://app.guliva.io/api/v1/user/register";

        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            'Content-Type': 'application/json', 
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3QxQGdtYWlsLmNvbSIsInBob25lIjoiMDkwMDAwMDAwMDAiLCJpYXQiOjE3MjA2MTk5OTd9.AbOuwtbHGjBtklCkphVvQ1o1GjM53wgUVPA_QCQqh0Q"
          },
          body: jsonEncode({
            'firstName': firstName,
            'lastName': lastName,
            'phoneNo': phoneNo,
            'email': email,
            'dob': dob,
            'password': password,
          }),
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);
          print(data);

          bool isSuccess = data["success"];
          if (isSuccess == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const VehicleScreen(),
              ),
            );
          }

          // Successful sign up
          print("User signed up successfully");
        } else {
          // Error during sign-up
          print(": ${response.body}");
        }
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sign Up Failed")),
      );
    }
  }
}
