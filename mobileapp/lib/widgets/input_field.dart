import 'package:flutter/material.dart';

enum InputFieldType { email, password, name }

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
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(12, 26),
          blurRadius: 50,
          spreadRadius: 0,
          color: Colors.grey.withOpacity(.1),
        ),
      ]),
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: widget.fieldType == InputFieldType.password
            ? !pwdVisibility
            : false,
        keyboardType: widget.fieldType == InputFieldType.email
            ? TextInputType.emailAddress
            : TextInputType.text,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
          fillColor: Colors.transparent,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(.1), width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(.1), width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          suffixIcon: widget.fieldType == InputFieldType.password
              ? InkWell(
                  onTap: () => setState(() => pwdVisibility = !pwdVisibility),
                  child: Icon(
                    pwdVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey.shade400,
                    size: 18,
                  ),
                )
              : null,
        ),
        validator: (val) {
          if (val!.isEmpty) {
            return 'Required';
          }
          if (widget.fieldType == InputFieldType.email &&
              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(val)) {
            return 'Invalid email';
          }
          return null;
        },
      ),
    );
  }
}
