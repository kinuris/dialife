import 'package:auto_size_text/auto_size_text.dart';
import 'package:dialife/blood_glucose_tracking/glucose_tracking.dart';
import 'package:dialife/user.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class GlucoseTrackingNoData extends StatelessWidget {
  final User user;
  final Database db;

  const GlucoseTrackingNoData({
    required this.db,
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 300,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const AutoSizeText(
                "New to Glucose Tracker?",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              ),
              const Text("You don't have any data: "),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          color: fgColor,
                          iconSize: 48,
                          icon: const Icon(Icons.import_export),
                        ),
                      ),
                      const Text("IMPORT"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () async {
                            await Navigator.of(context).pushNamed(
                              "/blood-glucose-tracking/input",
                              arguments: {
                                "db": db,
                                "user": user,
                              },
                            );

                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
                          },
                          color: fgColor,
                          iconSize: 48,
                          icon: const Icon(Icons.add),
                        ),
                      ),
                      const Text("ADD"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
