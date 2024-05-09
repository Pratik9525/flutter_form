import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Registration Form'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MyForm(),
          ),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              // Validation logic for Name field
              if (value?.trim().isEmpty ?? true || value!.length > 30) {
                return 'Name must be up to 30 characters';
              }
              if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value!)) {
                return 'Only English characters are allowed';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: addressController,
            decoration: InputDecoration(
              labelText: 'Address',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              // Validation logic for Address field
              if (value?.trim().isEmpty ?? true || value!.length > 50) {
                return 'Address must be up to 50 characters';
              }
              if (!RegExp(r'^[a-zA-Z0-9- ]+$').hasMatch(value!)) {
                return 'Invalid address format';
              }
              return null;
            },
          ),
          SizedBox(height: 10, width: 200.0),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email ID',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              // Validation logic for Email ID field
              if (value?.trim().isEmpty ?? true) {
                return 'Invalid email format';
              }
              if (!RegExp(r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$')
                  .hasMatch(value!)) {
                return 'Invalid email format';
              }
              return null;
            },
          ),
          SizedBox(height: 10, width: 200.0),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            validator: (value) {
              // Validation logic for Password field
              if (value?.trim().isEmpty ?? true) {
                return 'Password must be 8 characters with at least one uppercase letter, one lowercase letter, one number, and one special symbol';
              }
              if (value!.length < 8 ||
                  !RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                      .hasMatch(value)) {
                return 'Password must be 8 characters with at least one uppercase letter, one lowercase letter, one number, and one special symbol';
              }
              return null;
            },
          ),
          SizedBox(height: 10, width: 200.0),
          TextFormField(
            controller: mobileController,
            decoration: InputDecoration(
              labelText: 'Mobile Number',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              // Validation logic for Mobile Number field
              if (value?.trim().isEmpty ?? true) {
                return 'Invalid mobile number format. Please enter a valid mobile number starting with a "+" followed by the country code and a 10-digit number.';
              }
              if (!RegExp(r'^\+\d{1,3}\d{10}$').hasMatch(value!)) {
                return 'Invalid mobile number format. Please enter a valid mobile number starting with a "+" followed by the country code and a 10-digit number.';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Form is valid, process the data
                // Implement your logic here
                print('Form submitted successfully!');
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
