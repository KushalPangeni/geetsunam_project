import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

TextFormField foremail(String labeltext, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    validator: (email) {
      if (email != null && !EmailValidator.validate(email)) {
        return "Enter valid email";
      } else {
        return null;
      }
    },
    style: const TextStyle(fontSize: 15),
    decoration: InputDecoration(
      // prefixIcon: icon,
      labelText: labeltext,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}

TextFormField forpassword(String labeltext, TextEditingController controller) {
  return TextFormField(
    obscureText: true,
    controller: controller,
    validator: (value) {
      if (value != null && value.length < 7) {
        return "Enter min. 7 characters";
      } else {
        return null;
      }
    },
    style: const TextStyle(fontSize: 15),
    decoration: InputDecoration(
      // prefixIcon: icon,
      labelText: labeltext,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
