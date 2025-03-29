import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizzmak/Screens/quiz_screen.dart';

class QuizCategory extends StatefulWidget {
  const QuizCategory({super.key});

  @override
  State<QuizCategory> createState() => _QuizCategoryState();
}

class _QuizCategoryState extends State<QuizCategory> {
  final CollectionReference myCollection = FirebaseFirestore.instance
      .collection("QuestionsTest");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: StreamBuilder(
          stream: myCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError ||
                !snapshot.hasData ||
                snapshot.data!.docs.isEmpty) {
              return Center(child: Text("ไม่พบหมวดหมู่"));
            }

            final List<Color> colors = [
              Colors.grey,
              Colors.blue,
              Colors.green,
              Colors.purpleAccent,
            ];

            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => QuizScreen(
                              categoryName: documentSnapshot["title"],
                            ),
                      ),
                    );
                  },

                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: colors[index % colors.length],
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          child: Image.network(
                            documentSnapshot["image_url"],
                            height: 130,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          documentSnapshot["title"],
                          textAlign: TextAlign.center,
                          maxLines: 2,

                          style: TextStyle(
                            height: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
