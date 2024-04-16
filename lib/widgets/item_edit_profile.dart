import 'package:flutter/material.dart';

class GenderDropdown extends StatefulWidget {
  final String? initialValue;
  final void Function(String)? onChanged;

  const GenderDropdown({Key? key, this.initialValue, this.onChanged})
      : super(key: key);

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? gender;

  @override
  void initState() {
    super.initState();
    gender = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Gender',
          border: OutlineInputBorder(),
        ),
        value: gender,
        onChanged: (newValue) {
          setState(() {
            gender = newValue;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(newValue!);
          }
        },
        items: <String>['Male', 'Female', 'Other']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
