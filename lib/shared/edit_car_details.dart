import 'package:flutter/material.dart';
import 'package:unblockmycar/shared/common_text.dart';

class EditCarDetails extends StatelessWidget {
  final String name1;
  final String name2;
  final String name3;
  final String name4;
  final String? name5;

  final String value1;
  final String value2;
  final String value3;
  final String value4;
  final String? value5;
  const EditCarDetails({
    super.key,
    required this.name1,
    required this.name2,
    required this.name3,
    required this.name4,
    this.name5,

    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
    this.value5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CommonText(name: "$name1:", textcolor: Colors.grey.shade700),
              SizedBox(width: 5),
              CommonText(name: value1, textcolor: Colors.black),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              CommonText(name: "$name2:", textcolor: Colors.grey.shade700),
              SizedBox(width: 5),
              CommonText(name: value2, textcolor: Colors.black),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              CommonText(name: "$name3:", textcolor: Colors.grey.shade700),
              SizedBox(width: 5),
              CommonText(name: value3, textcolor: Colors.black),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              CommonText(name: "$name4:", textcolor: Colors.grey.shade700),
              SizedBox(width: 5),
              CommonText(name: value4, textcolor: Colors.black),
            ],
          ),
          SizedBox(height: 5),
          (value5 != null)
              ? Row(
                  children: [
                    CommonText(
                      name: "$name5:",
                      textcolor: Colors.grey.shade700,
                    ),
                    SizedBox(width: 5),
                    CommonText(name: value5 ?? "", textcolor: Colors.black),
                  ],
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
