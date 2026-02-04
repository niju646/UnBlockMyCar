import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unblockmycar/shared/common_button.dart';
import 'package:unblockmycar/shared/common_text.dart';
import 'package:unblockmycar/shared/edit_car_details.dart';
import 'package:unblockmycar/shared/status_chip.dart';

class CommonBottomSheet extends StatelessWidget {
  const CommonBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.90,
      minChildSize: 0.25,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  // drag handle
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CommonText(name: "KL-07-AB-1234", fontsize: 20),
                  SizedBox(height: 30),
                  EditCarDetails(
                    name1: "Model",
                    value1: "Hyundai Creta",
                    name2: "Type",
                    value2: "SUV",
                    name3: "Color",
                    value3: "White",
                    name4: "Fuel",
                    value4: "Petrol",
                    name5: "Year",
                    value5: "2024",
                  ),

                  SizedBox(height: 40),

                  Row(
                    children: [
                      Icon(Icons.shield_outlined),
                      SizedBox(width: 10),
                      CommonText(name: "Insurance Details", fontsize: 20),
                      Spacer(),
                      Icon(Icons.edit),
                    ],
                  ),
                  SizedBox(height: 20),
                  EditCarDetails(
                    name1: "Company",
                    value1: "HDFC ERGO",
                    name2: "Policy",
                    value2: "POLDEMO1234",
                    name3: "Expiry",
                    value3: "2026-02-12",
                    name4: "status",
                    value4: "Expiring",
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.warning_amber_rounded),
                      SizedBox(width: 10),
                      CommonText(name: "Challans", fontsize: 20),
                    ],
                  ),
                  SizedBox(height: 20),

                  //chalan container
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              name: "Without seatbelt",
                              font: FontWeight.bold,
                            ),
                            SizedBox(height: 5),
                            CommonText(name: "Kochi 2026-01-14"),
                          ],
                        ),
                        Spacer(),
                        StatusChip(
                          text: "₹1000",
                          bgColor: Colors.red[100]!,
                          textColor: Colors.red[700]!,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  CommonButton(
                    color: Colors.red.shade700,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.delete, color: Colors.white),
                        SizedBox(width: 10),
                        CommonText(
                          name: "Remove Vehicle",
                          textcolor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
