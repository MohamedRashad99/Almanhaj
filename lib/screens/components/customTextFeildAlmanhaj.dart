// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'constants.dart';

// ignore: camel_case_types
class CustomTextField_AlManhaj extends StatefulWidget {
  final String? hint;
  final bool? label;
  final TextInputType? type;
  final ValueChanged<String>? onsave;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final IconData? icon;
  final IconData? eIcon;
  final IconData? dIcon;
  final FocusNode? focus;
  final bool read;
  final bool? line;
  final Function? edit;
  final bool? isEdit;
  // ignore: use_key_in_widget_constructors
  const CustomTextField_AlManhaj({
    this.hint,
    this.onsave,
    this.onTap,
    this.icon,
    this.type,
    this.validator,
    this.controller,
    this.focus,
    this.dIcon,
    this.label,
    this.read = false,
    this.eIcon,
    this.edit,
    this.isEdit,
    this.line,
  });
  @override
  _CustomTextField_AlManhajState createState() => _CustomTextField_AlManhajState();
}

class _CustomTextField_AlManhajState extends State<CustomTextField_AlManhaj> {
  bool _isHidden = true;
  void _visibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: TextFormField(
        onTap: widget.onTap,
        validator: widget.validator,
        controller: widget.controller,
        cursorColor: kPrimaryColor,
        focusNode: widget.focus,
        readOnly: widget.read,
        maxLines: widget.line == true ? 7 : 1,
        obscureText: widget.icon == Icons.lock_outline ? _isHidden : false,
        keyboardType: widget.type,
        onChanged: (widget.onsave),
        style: const TextStyle(fontSize: 14, color: kPrimaryColor),
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: Icon(
            widget.dIcon,
            color: kPrimaryColor,
          ),
          labelText: widget.label == true ? "+966" : null,
          icon: widget.isEdit == true ? const Icon(Icons.edit) : null,
          labelStyle: const TextStyle(
            fontSize: 16,
            color: kPrimaryColor,
            fontFamily: "Khebrat Musamim",
          ),
          hintStyle: const TextStyle(
              fontSize: 14, color: kTextColor, fontFamily: "Khebrat Musamim"),
          suffixIcon: widget.icon == Icons.lock_outline
              ? IconButton(
                  onPressed: _visibility,
                  alignment: Alignment.center,
                  icon: _isHidden
                      ? const Icon(
                          Icons.visibility_off,
                          color: kTextColor,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: kPrimaryColor,
                        ),
                )
              : null,
          filled: true,
          //prefixText: widget.hint,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
