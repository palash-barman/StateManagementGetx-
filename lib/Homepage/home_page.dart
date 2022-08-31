import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/controller_home_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomePageController _controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      _controller.isLoading.value = false;
    });
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          "State Management ",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Obx(() {
        return _controller.isLoading.value
            ? const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 5,
                  ),
                ),
              )
            : Center(
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  elevation: 5,
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Image.asset(
                              _controller
                                  .imageList[_controller.selectIndex.value],
                              height: 250,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: _controller.decrement(),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _controller.selectIndex.value == 0
                                      ? Colors.black
                                      : Colors.pink,
                                ),
                                child: const Icon(
                                  Icons.arrow_left,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              "${_controller.selectIndex.value + 1}",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: _controller.increment(),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _controller.selectIndex.value ==
                                          _controller.imageList.length - 1
                                      ? Colors.black
                                      : Colors.pink,
                                ),
                                child: const Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
