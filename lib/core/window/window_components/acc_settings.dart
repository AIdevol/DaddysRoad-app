import 'package:flutter/material.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  String groupType = '';
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emergencyContact1Controller =
      TextEditingController();
  final TextEditingController _emergencyContact2Controller =
      TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _bloodGroupController.dispose();
    _ageController.dispose();
    _emergencyContact1Controller.dispose();
    _emergencyContact2Controller.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Account Settings',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("First Name"),
          TextFormField(controller: _firstNameController),
          const Text("Last Name"),
          TextFormField(controller: _lastNameController),
          const Text("Email"),
          TextFormField(controller: _emailController),
          const Text("Phone Number"),
          TextFormField(controller: _phoneNumberController),
          _buildDropdown(),
          const SizedBox(height: 20),
          const Text("Emergency Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 10),
          const Text("Blood Group"),
          TextFormField(controller: _bloodGroupController),
          const Text("Age"),
          TextFormField(controller: _ageController),
          const Text("Emergency contact 1"),
          TextFormField(controller: _emergencyContact1Controller),
          const Text("Emergency contact 2"),
          TextFormField(controller: _emergencyContact2Controller),
          const SizedBox(height: 20),
          _buildChangePasswordButton(context),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(labelText: 'Group type'),
      value: groupType.isEmpty ? null : groupType,
      onChanged: (String? newValue) {
        setState(() {
          groupType = newValue ?? '';
        });
      },
      items: const ['Male', 'Female']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildChangePasswordButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _showChangePasswordBottomSheet(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: Colors.amber,
          minimumSize: Size(300, 50),
        ),
        child: const Text("Change Password",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black)),
      ),
    );
  }

  void _showChangePasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Change Password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _oldPasswordController,
                decoration: InputDecoration(
                  hintText: 'Old Password',
                  icon: Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_off),
                    onPressed: () {
                      // Toggle password visibility
                    },
                  ),
                ),
                obscureText: true,
              ),
              TextFormField(
                controller: _newPasswordController,
                decoration: InputDecoration(
                  hintText: 'New Password',
                  icon: Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_off),
                    onPressed: () {
                      // Toggle password visibility
                    },
                  ),
                ),
                obscureText: true,
              ),
              TextFormField(
                controller: _confirmNewPasswordController,
                decoration: InputDecoration(
                  hintText: 'Repeat New Password',
                  icon: Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_off),
                    onPressed: () {
                      // Toggle password visibility
                    },
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to change password
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: const Text('Save',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: Colors.amber,
                      // minimumSize: Size(300, 50),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to change password
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: const Text('Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: Colors.amber,
                      // minimumSize: Size(300, 50),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
