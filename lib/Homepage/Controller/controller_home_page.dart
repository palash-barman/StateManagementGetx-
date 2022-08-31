import 'package:get/get.dart';

class HomePageController extends GetxController {
  final List imageList = [
    "assets/image/images1.jpg",
    "assets/image/images2.jpg",
    "assets/image/images3.jpg",
    "assets/image/images4.jpg",
  ];
  var selectIndex = 0.obs;
  RxBool isLoading = true.obs;

  decrement() {
    if (selectIndex.value > 0) {
      selectIndex.value--;
    }
  }

  increment() {
    if (selectIndex.value < imageList.length - 1) {
      selectIndex.value++;
    }
  }
}
