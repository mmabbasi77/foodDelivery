import 'package:get/get.dart';

class Summations {
  int summation(RxList numList) {
    RxInt sum = 0.obs;
    if (numList.length == 1) {
      sum = numList[0];
    } else {
      for (int i = 0; i < numList.length - 1; i++) {
        sum.value = numList[i].value + numList[i + 1].value;
      }
    }

    return sum.value;
  }
}
