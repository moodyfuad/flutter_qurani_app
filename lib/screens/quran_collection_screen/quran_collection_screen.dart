// import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
// import 'package:google_fonts/google_fonts.dart';

// class MySavingScreen extends StatefulWidget {
//   const MySavingScreen({super.key});

//   @override
//   State<MySavingScreen> createState() => _MySavingScreenState();
// }

// class _MySavingScreenState extends State<MySavingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView(
//         shrinkWrap: true,
//         children: [
//           Row(
//             children: [
//               Placeholder(fallbackHeight: 40),
//               // Placeholder(fallbackHeight: 40),
//             ],
//           ),
//           GridView.builder(
//             padding: EdgeInsets.all(30),
//             scrollDirection: Axis.vertical,

//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//             ),
//             itemCount: 5,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 30,
//                   vertical: 8.0,
//                 ),
//                 child: Stack(
//                   children: [
//                     Expanded(child: Placeholder()),
//                     Align(
//                       alignment: Alignment.topCenter,
//                       child: Text(
//                         'الاسم',
//                         style: GoogleFonts.reemKufi().copyWith(
//                           fontSize: Get.textTheme.headlineMedium!.fontSize,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:qurani_app/models/quran_collection_model.dart';
import 'package:qurani_app/shared/constants/asset_const.dart';

class QuranCollectionsScreen extends StatefulWidget {
  const QuranCollectionsScreen({super.key});

  @override
  State<QuranCollectionsScreen> createState() => _QuranCollectionsScreenState();
}

class _QuranCollectionsScreenState extends State<QuranCollectionsScreen> {
  List<QuranCollectionModel> collections = [
    QuranCollectionModel(
      name: "جزء عم",
      pages: List.generate(20, (i) => i + 1),
      completedPages: [1, 2, 5],
    ),
    QuranCollectionModel(
      name: "سوة البقرة",
      pages: List.generate(40, (i) => i + 50),
      completedPages: [50, 51, 55, 56, 57],
    ),
  ];

  final TextEditingController _nameController = TextEditingController();

  void _addCollection() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("New Collection"),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: "Collection name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty) {
                  setState(() {
                    collections.add(
                      QuranCollectionModel(name: _nameController.text),
                    );
                  });
                  _nameController.clear();
                }
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _addPage(QuranCollectionModel collection) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController pageController = TextEditingController();
        return AlertDialog(
          title: Text("Add Page to ${collection.name}"),
          content: TextField(
            controller: pageController,
            decoration: const InputDecoration(hintText: "Page number"),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                int? page = int.tryParse(pageController.text);
                if (page != null && !collection.pages.contains(page)) {
                  setState(() {
                    collection.pages.add(page);
                  });
                }
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _toggleComplete(QuranCollectionModel collection, int page) {
    setState(() {
      if (collection.completedPages.contains(page)) {
        collection.completedPages.remove(page);
      } else {
        collection.completedPages.add(page);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("قوائمي", style: GoogleFonts.reemKufi()),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCollection,
        child: const Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.6),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.orange.withValues(alpha: 0.5),
              BlendMode.color,
            ),
            image: AssetImage(
              AssetConst.homeBgImagePath,
              bundle: DefaultAssetBundle.of(context),
            ),
            fit: BoxFit.cover,
          ),
        ),

        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: collections.length,
          itemBuilder: (context, index) {
            final collection = collections[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  // Show pages and allow marking as completed
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              collection.name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton.icon(
                              onPressed: () => _addPage(collection),
                              icon: const Icon(Icons.add),
                              label: const Text("Add Page"),
                            ),
                            const SizedBox(height: 15),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: collection.pages.map((page) {
                                bool done = collection.completedPages.contains(
                                  page,
                                );
                                return ChoiceChip(
                                  label: Text("Page $page"),
                                  selected: done,
                                  onSelected: (_) =>
                                      _toggleComplete(collection, page),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircularPercentIndicator(
                        radius: 35.0,
                        lineWidth: 8.0,
                        animation: true,
                        percent: collection.completionPercent,
                        center: Text(
                          "${(collection.completionPercent * 100).toStringAsFixed(0)}%",
                          style: GoogleFonts.reemKufi(),
                        ),
                        progressColor: Colors.orange[600],
                      ).animate().scale(
                        duration: 500.ms,
                        curve: Curves.easeOutBack,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              collection.name,
                              style: GoogleFonts.reemKufi().copyWith(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "تم حفظ: ${collection.studiedPages} من ${collection.totalPages}",
                              style: GoogleFonts.reemKufiFun().copyWith(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
