import 'package:flutter/material.dart';

enum InputFieldType { email, password, name, number, description }

class CustomInputField extends StatefulWidget {
  final InputFieldType fieldType;
  final String hintText;
  final String labelText;
  final TextEditingController textEditingController;

  const CustomInputField({
    Key? key,
    required this.fieldType,
    required this.textEditingController,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool pwdVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.fieldType == InputFieldType.description ? null : 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(12, 26),
          blurRadius: 50,
          spreadRadius: 0,
        ),
      ]),
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: widget.fieldType == InputFieldType.password
            ? !pwdVisibility
            : false,
        keyboardType: widget.fieldType == InputFieldType.email
            ? TextInputType.emailAddress
            : widget.fieldType == InputFieldType.number
                ? TextInputType.number
                : TextInputType.text,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        maxLines: widget.fieldType == InputFieldType.description ? 5 : 1,
        // decoration: InputDecoration(
        //   labelText: widget.labelText,
        //   floatingLabelBehavior: FloatingLabelBehavior.always,
        //   filled: true,
        //   hintText: widget.hintText,
        //   hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
        //   fillColor: Colors.transparent,
        //   contentPadding:
        //       const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        //   border: OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: Colors.grey.withOpacity(.1), width: 2.0),
        //     borderRadius: BorderRadius.circular(25.0),
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.indigo, width: 2.0),
        //     borderRadius: BorderRadius.circular(25.0),
        //   ),
        //   errorBorder: const OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.red, width: 2.0),
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderSide:
        //         BorderSide(color: Colors.grey.withOpacity(.1), width: 2.0),
        //     borderRadius: BorderRadius.circular(25.0),
        //   ),
        //   suffixIcon: widget.fieldType == InputFieldType.password
        //       ? InkWell(
        //           onTap: () => setState(() => pwdVisibility = !pwdVisibility),
        //           child: Icon(
        //             pwdVisibility
        //                 ? Icons.visibility_outlined
        //                 : Icons.visibility_off_outlined,
        //             color: Colors.grey.shade400,
        //             size: 18,
        //           ),
        //         )
        //       : null,
        // ),
        validator: (val) {
          if (val!.isEmpty) {
            return 'Required';
          }
          if (widget.fieldType == InputFieldType.email &&
              !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(val)) {
            return 'Invalid email';
          }
          if (widget.fieldType == InputFieldType.number &&
              !RegExp(r'^\d+$').hasMatch(val)) {
            return 'Invalid number';
          }
          return null;
        },
      ),
    );
  }
}

class FormValidationScreen extends StatefulWidget {
  @override
  _FormValidationScreenState createState() => _FormValidationScreenState();
}

class _FormValidationScreenState extends State<FormValidationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Form is valid!'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Form is not valid!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomInputField(
                fieldType: InputFieldType.email,
                textEditingController: _emailController,
                hintText: 'Enter your email',
                labelText: 'Email',
              ),
              SizedBox(height: 10),
              CustomInputField(
                fieldType: InputFieldType.password,
                textEditingController: _passwordController,
                hintText: 'Enter your password',
                labelText: 'Password',
              ),
              SizedBox(height: 10),
              CustomInputField(
                fieldType: InputFieldType.name,
                textEditingController: _nameController,
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
              SizedBox(height: 10),
              CustomInputField(
                fieldType: InputFieldType.number,
                textEditingController: _numberController,
                hintText: 'Enter your number',
                labelText: 'Number',
              ),
              SizedBox(height: 10),
              CustomInputField(
                fieldType: InputFieldType.description,
                textEditingController: _descriptionController,
                hintText: 'Enter a description',
                labelText: 'Description',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateForm,
                child: Text('Validate Form'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}