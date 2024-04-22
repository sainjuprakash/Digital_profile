import 'individual_bar.dart';

class BarData {
  final double rai;
  final double pahadiAdibasi;
  final double brahman;
  final double newar;
  final double tamang;
  final double bahun;
  final double others;

  BarData(
      {required this.rai,
      required this.pahadiAdibasi,
      required this.brahman,
      required this.newar,
      required this.tamang,
      required this.bahun,
      required this.others});

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 1, y: rai),
      IndividualBar(x: 2, y: pahadiAdibasi),
      IndividualBar(x: 3, y: brahman),
      IndividualBar(x: 4, y: newar),
      IndividualBar(x: 5, y: tamang),
      IndividualBar(x: 6, y: bahun),
      IndividualBar(x: 7, y: others),

    ];
  }
}
