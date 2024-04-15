import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../resources/family_details.dart';
import '../resources/repository.dart';

class AllHouseholdData extends StatefulWidget {
  const AllHouseholdData({super.key});

  @override
  State<AllHouseholdData> createState() => _AllHouseholdDataState();
}

class _AllHouseholdDataState extends State<AllHouseholdData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             const Text('All HouseHold Data',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
            const SizedBox(height: 20,),
            Expanded(
              child: FutureBuilder<List<FamilyDetailsModel>>(
                  future: LoadFamilyData(),
                  builder: (context, snapshot) {
                    List<FamilyDetailsModel>? loadedData = snapshot.data;
                    if (snapshot.hasData) {

                      print(snapshot);
                      print(
                          '<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');

                      return ListView.builder(
                          itemCount: loadedData?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                elevation: 2,
                                  child:Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [const Text('Respondent : '),
                                          Text(loadedData![index].respondent)],
                                        ),
                                        Row(
                                          children: [const Text('Ward Number : '),
                                            Text(loadedData![index].wardNo)],
                                        ),
                                        Row(
                                          children: [const Text('Settlement Name : '),
                                            Text(loadedData![index].setName)],
                                        ),
                                        Row(
                                          children: [const Text('Settlement Road : '),
                                            Text(loadedData![index].road)],
                                        ),
                                        Row(
                                          children: [const Text('Road to House : '),
                                            Text(loadedData![index].roadToHouse)],
                                        ),
                                        Row(
                                          children: [const Text('Respondent Contact : '),
                                            Text(loadedData![index].phoneNumber)],
                                        ),
                                        Row(
                                          children: [const Text('Respondent Relation : '),
                                            Text(loadedData![index].relation)],
                                        ),
                                        Row(
                                          children: [const Text('Migration Type : '),
                                            Text(loadedData![index].migrationType)],
                                        ),
                                        Row(
                                          children: [const Text('Family Number : '),
                                            Text(loadedData![index].familyCount)],
                                        ),
                                        Row(
                                          children: [const Text('Family Death : '),
                                            Text(loadedData![index].isDeath)],
                                        ),
                                        Row(
                                          children: [const Text('Insurance : '),
                                            Text(loadedData![index].insurance)],
                                        ),
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
