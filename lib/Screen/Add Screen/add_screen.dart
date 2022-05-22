import 'package:flutter/material.dart';
import 'package:hive_application/Constant/color.dart';
import 'package:hive_application/Model%20Class%20Hive/data.dart';
import 'package:hive_application/Screen/Add%20Screen/hive_box.dart';
import 'package:hive_application/Screen/Add%20Screen/image_list.dart';
import 'package:hive_application/Screen/Home%20Screen/home_screen.dart';
import 'package:hive_application/Screen/List%20Screen/list_screen.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isImageSelected = false;
  String imageController = '';
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'H ',
                                style:
                                    TextStyle(fontSize: 22, color: Colors.grey),
                              ),
                              Text(
                                'Title',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            height: 60,
                            width: double.infinity,
                            child: TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                prefixIcon: const Icon(
                                  Icons.text_fields_outlined,
                                ),
                                hintText: 'write your title here',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.description,
                                color: Colors.grey.shade300,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 200,
                            child: TextField(
                              controller: descriptionController,
                              textAlign: TextAlign.justify,
                              maxLines: null,
                              expands: true,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                prefixIcon: const Icon(
                                  Icons.text_fields_outlined,
                                ),
                                hintText: 'write your description here',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.image,
                                color: Colors.grey.shade300,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Photos',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) => index == 0
                                  ? GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 10, left: 15),
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: Colors.grey.shade300,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 50,
                                          color: primary,
                                        ),
                                      ),
                                    )
                                  : Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              currentIndex = index;
                                              imageController = images[index];
                                              isImageSelected = true;
                                            });
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, left: 15),
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    images[index],
                                                  ),
                                                  fit: BoxFit.cover,
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.black.withOpacity(
                                                        currentIndex == index
                                                            ? 0.2
                                                            : 0),
                                                    BlendMode.darken,
                                                  ),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                          ),
                                        ),
                                        currentIndex == index
                                            ? Positioned(
                                                left: 25,
                                                top: 20,
                                                child: Icon(
                                                  Icons.check,
                                                  color: secondary,
                                                  size: 50,
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    )),
                            ),
                          ),
                       
                      SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const HomeScreen()),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  primary: primary,
                                  side: BorderSide(
                                    color: primary,
                                    width: 2,
                                  ),
                                  fixedSize: const Size(150, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                                child: const Text('Cancel'),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    if (titleController.text.isNotEmpty &&
                                        descriptionController.text.isNotEmpty &&
                                        isImageSelected == true) {
                                      addData(
                                        titleController.text,
                                        descriptionController.text,
                                        imageController,
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) =>
                                              const ListScreen()),
                                        ),
                                      );
                                      titleController.clear();
                                      descriptionController.clear();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('All fiels are required'),
                                        ),
                                      );
                                    }
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: primary,
                                  side: BorderSide.none,
                                  fixedSize: const Size(150, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                ),
                                child: const Text('Save'),
                              ),
                            ],
                          ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),


                        ],
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment(0.5, -1.05),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.8, -1.05),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.star_rate_rounded,
                      color: secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void addData(String title, String description, String image) {
    final data = Data()
      ..title = title
      ..description = description
      ..image = image;
    final box = Boxes.getData();
    box.add(data);
  }
}
