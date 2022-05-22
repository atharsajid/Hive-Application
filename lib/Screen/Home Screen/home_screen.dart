import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_application/Constant/color.dart';
import 'package:hive_application/Screen/Add%20Screen/add_screen.dart';
import 'package:hive_application/Screen/Home%20Screen/model.dart';
import 'package:hive_application/Screen/List%20Screen/list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.sort)),
          const Padding(padding: EdgeInsets.only(right: 10))
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
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
                const Text(
                  "Hi Sonia",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Text(
                  "Welcome Back 👋",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
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
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Row(
              children: [
                const Text(
                  'Category',
                  style: TextStyle(
                    color: Color(0xff010326),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.delete,
                  color: Color(0xffAAA7F2),
                ),
                const Icon(
                  Icons.edit,
                  color: Color(0xffAAA7F2),
                ),
                Icon(
                  Icons.sort,
                  color: primary,
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                itemCount: category.length,
                itemBuilder: (context, index) => CategoryBox(
                      categorylist: category[index],
                    )),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
          )),
    );
  }
}

class CategoryBox extends StatelessWidget {
  final Category categorylist;
  const CategoryBox({Key? key, required this.categorylist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categorylist.color2,
        borderRadius: BorderRadius.circular(
          32,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categorylist.icon,
            height: 50,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            categorylist.name,
            style: TextStyle(
              color: categorylist.color1,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }
}
