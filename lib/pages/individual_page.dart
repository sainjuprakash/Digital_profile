import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/family_details.dart';
import '../resources/repository.dart';

class IndividualPage extends StatefulWidget {
  final int indexOfCard;
  const IndividualPage({super.key, required this.indexOfCard});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<FamilyDetailsModel>>(
                  future: LoadFamilyData(),
                  builder: (context, snapshot) {
                    List<FamilyDetailsModel>? loadedData = snapshot.data;
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: loadedData?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemBuilder: (context, valueIndex) {
                                            return Text(
                                                "Family Individual : ${loadedData![index].individualData[valueIndex].individualName}");
                                          },
                                          itemCount: loadedData![index]
                                              .individualData
                                              .length,
                                        )
                                      ],
                                    ),
                                  )),
                            );
                          });
                    } else if (snapshot.hasError) {
                      const Text('Data fetch failure');
                      // print(snapshot.);
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
