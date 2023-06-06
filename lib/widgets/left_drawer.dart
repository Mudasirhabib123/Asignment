import 'dart:async';

import 'package:assignment/classes/utils.dart';
import 'package:assignment/models/dummy_data.dart';
import 'package:flutter/material.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({super.key});

  @override
  State<LeftDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<LeftDrawer> {
  Utils utils = Utils();
  // DateTime now = DateTime.now();
  String time = '';
  int groupvalue = -1; // value for radio buttons
  var dummyData = DummyData().dynamicDummyData;
  bool chec = false;
  late Timer timer;

  @override
  initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      DateTime now = DateTime.now();
      setState(() {
        time = "${now.hour}:${now.minute}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(time),
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height / 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Day',
                        style: TextStyle(color: Colors.white),
                      ),
                      Radio<int>(
                        value: 0,
                        fillColor: const MaterialStatePropertyAll(Colors.white),
                        groupValue: groupvalue,
                        onChanged: (int? val) {
                          setState(() {
                            groupvalue = val!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Week',
                        style: TextStyle(color: Colors.white),
                      ),
                      Radio<int>(
                        value: 1,
                        fillColor: const MaterialStatePropertyAll(Colors.white),
                        groupValue: groupvalue,
                        onChanged: (int? val) {
                          setState(() {
                            groupvalue = val!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              // child: buildNestedWidgets(dummyData),
              child: Column(
                children: [
                  for (int i = 0; i < dummyData.length; i++)
                    Padding(
                      padding: EdgeInsets.only(
                          left: 12.0 * ((dummyData[i]['key'] as double) - 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${dummyData[i]['title']}'),
                          Checkbox(
                              value: dummyData[i]['value'] as bool,
                              fillColor: const MaterialStatePropertyAll(Colors
                                  .lightBlue), // Colors.lightBlue To Follow design
                              onChanged: (val) {
                                utils.updateDummyData(i, val!, dummyData);

                                setState(() {});
                              })
                        ],
                      ),
                    ),
                ],
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  // parentToChild(String child, String parent) {
  //   for (var item in dummyData) {
  //     // final String title = item['title'];
  //     // final String parent = item['parent'];

  //     if (parent != 'null') {
  //       final parentItem = dummyData.firstWhere(
  //         (element) => element['title'] == parent,
  //         orElse: () => <String, Object>{},
  //       );
  //       if (parentItem.isNotEmpty) {
  //         // print('$title has parent: $parent');
  //         return true;
  //       } else {
  //         return false;
  //       }
  //     }
  //   }
  // }
  // Widget buildNestedWidgets(Map<dynamic, dynamic> map) {
  //   int i = 0;
  //   return Column(
  //     children: map.entries.map((entry) {
  //       if (entry.value is Map<dynamic, dynamic>) {
  //         i = i + 1;
  //         return buildNestedWidgets(entry.value);
  //       } else {
  //         return CheckboxWithTitle(
  //           title: entry.key,
  //           value: entry.value,
  //           paddingFactor: i,
  //         );
  //       }
  //     }).toList(),
  //   );
  // }
}

