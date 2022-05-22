import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_application/Constant/color.dart';
import 'package:hive_application/Model%20Class%20Hive/data.dart';
import 'package:hive_application/Screen/Add%20Screen/hive_box.dart';
import 'package:hive_application/Screen/Home%20Screen/home_screen.dart';
import 'package:hive_application/Screen/List%20Screen/labels_list.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(
                  32,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const HomeScreen()),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const HomeScreen()),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  height: 60,
                  width: double.infinity,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.5),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: 'What category are you searching for?',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 20, bottom: 20),
            child: Text(
              'Labels',
              style: TextStyle(
                color: Color(0xff010326),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              itemBuilder: (context, index) {
                return index == 0
                    ? Container(
                        margin: const EdgeInsets.only(left: 15),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey.shade300),
                        child: Icon(
                          Icons.add,
                          color: primary,
                          size: 40,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 15),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? primary
                                : const Color(0xffAAA7F2),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(
                            labels[index],
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
          ValueListenableBuilder<Box<Data>>(
              valueListenable: Boxes.getData().listenable(),
              builder: (context, box, _) {
                final data = box.values.toList().cast<Data>();
                return Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(parent: null),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return containerTiles(data[index], data[index]);
                      }),
                );
              }),
        ],
      ),
    );
  }

  Container containerTiles(
    Data data,
    dynamic delete,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 5,
            color: Colors.grey.shade200,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(
                  data.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                data.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(
                      Icons.notifications,
                      color: Color(0xffAAA7F2),
                      size: 40,
                    ),
                    Icon(
                      Icons.star_rate_rounded,
                      color: Color(0xffAAA7F2),
                      size: 40,
                    )
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              setState(() {
                deletData(delete);
              });
            },
            icon: Icon(
              Icons.delete,
              color: secondary,
            ),
          ),
        ],
      ),
    );
  }

  void deletData(Data data) {
    data.delete();
  }
}
