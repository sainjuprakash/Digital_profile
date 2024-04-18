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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text(
              "All Family Members",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.blueAccent),
            ),
            Expanded(
              child: FutureBuilder<List<FamilyDetailsModel>>(
                  future: LoadFamilyData(),
                  builder: (context, snapshot) {
                    List<FamilyDetailsModel>? loadedData = snapshot.data;
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: loadedData![widget.indexOfCard]
                              .individualData
                              .length,
                          itemBuilder: (context, index) {
                            String sexText = '';
                            switch (loadedData[widget.indexOfCard]
                                .individualData[index]
                                .sex) {
                              case '1':
                                sexText = 'Male';
                                break;
                              case '2':
                                sexText = 'Female';
                                break;
                              case '3':
                                sexText = 'Others';
                                break;
                            }
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Family Individual Name : ${loadedData[widget.indexOfCard].individualData[index].individualName} ${loadedData[widget.indexOfCard].individualData[index].lastName}"),
                                        Text("Sex : $sexText"),
                                        Text(
                                            "Age : ${loadedData[widget.indexOfCard].individualData[index].age}"),
                                        Text(
                                            "Ethnicity : ${loadedData[widget.indexOfCard].individualData[index].ethnicity}"),

                                        Text(
                                            "HouseHold Head Relation : ${loadedData[widget.indexOfCard].individualData[index].hhdHead}"),
                                        Text(
                                            "Language : ${loadedData[widget.indexOfCard].individualData[index].language}"),
                                        Text(
                                            "Religion : ${loadedData[widget.indexOfCard].individualData[index].religion}"),
                                        Text(
                                            "Marital Status : ${loadedData[widget.indexOfCard].individualData[index].maritalStatus}"),
                                        Text(
                                            "Education : ${loadedData[widget.indexOfCard].individualData[index].education}"),
                                        Text(
                                            "Specialist : ${loadedData[widget.indexOfCard].individualData[index].specialist}"),
                                        Text(
                                            "Occupation : ${loadedData[widget.indexOfCard].individualData[index].occupation}"),

                                        Text(
                                            "Living Status : ${loadedData[widget.indexOfCard].individualData[index].livingStatus}"),
                                        Text(
                                            "Training : ${loadedData[widget.indexOfCard].individualData[index].name}"),
                                        Text(
                                            "Disability : ${loadedData[widget.indexOfCard].individualData[index].disability}"),
                                        Text(
                                            "Health Condition : ${loadedData[widget.indexOfCard].individualData[index].healthCondition}"),

                                        // ListView.builder(
                                        //   shrinkWrap: true,
                                        //   itemBuilder: (context, valueIndex) {
                                        //     return Text(
                                        //         "Family Individual : ${loadedData![widget.indexOfCard].individualData[valueIndex].individualName}");
                                        //   },
                                        //   itemCount: loadedData![index]
                                        //       .individualData
                                        //       .length,
                                        // )
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
