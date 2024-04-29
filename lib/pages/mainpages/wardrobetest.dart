import 'package:app/components/item_tile/wardrobe_item_tile.dart';
import 'package:app/components/sliver_app_bar/wardrobe_sliver_app_bar.dart';
import 'package:app/components/tab_bar/wardrobe_tab_bar.dart';
import 'package:app/components/textfields/my_search_textfield.dart';
import 'package:app/models/inventory/kswardrobe.dart';
import 'package:app/models/item/wardrobelist.dart';
import 'package:app/pages/second_page/wardrobe_borrow_return.dart';
import 'package:app/pages/transactions/transaction_categorized.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWardrobePageTest extends StatefulWidget {
  const MyWardrobePageTest({super.key});

  @override
  State<MyWardrobePageTest> createState() => _MyWardrobePageTestState();
}

class _MyWardrobePageTestState extends State<MyWardrobePageTest>
    with SingleTickerProviderStateMixin {
  //Tab Controller
  late TabController _tabController;

  //Search Controller
  TextEditingController searchController = TextEditingController();

  List<Wardrobe> searchResults = [];
  List<Wardrobe> wardrobeList = [];

  //INTERPOLATION SEARCH ALGORITHM
  int caseInsensitiveInterpolationSearch(
      List<Wardrobe> sortedList, String searchKey) {
    int lo = 0;
    int hi = sortedList.length - 1;
    searchKey = searchKey.toLowerCase();

    while (lo <= hi &&
        searchKey.compareTo(sortedList[lo].wardrobeName.toLowerCase()) >= 0 &&
        searchKey.compareTo(sortedList[hi].wardrobeName.toLowerCase()) <= 0) {
      if (lo == hi) {
        if (sortedList[lo].wardrobeName.toLowerCase() == searchKey) return lo;
        return -1;
      }

      int pos = lo +
          ((searchKey.compareTo(sortedList[lo].wardrobeName.toLowerCase()) *
                  (hi - lo)) ~/
              (sortedList[hi]
                  .wardrobeName
                  .toLowerCase()
                  .compareTo(sortedList[lo].wardrobeName.toLowerCase())));

      if (sortedList[pos].wardrobeName.toLowerCase() == searchKey) {
        return pos;
      }

      if (sortedList[pos].wardrobeName.toLowerCase().compareTo(searchKey) < 0) {
        lo = pos + 1;
      } else {
        hi = pos - 1;
      }
    }

    return -1;
  }

  //KMP SEARCH ALGORITHM
  List<int> computeLPSArray(String pattern) {
    int length = 0;
    int i = 1;
    List<int> lps = List.filled(pattern.length, 0);

    // Loop calculates the lps array
    while (i < pattern.length) {
      if (pattern[i] == pattern[length]) {
        length++;
        lps[i] = length;
        i++;
      } else {
        if (length != 0) {
          length = lps[length - 1];
        } else {
          lps[i] = 0;
          i++;
        }
      }
    }
    return lps;
  }

  List<int> KMPSearch(String text, String pattern) {
    int M = pattern.length;
    int N = text.length;
    List<int> lps = computeLPSArray(pattern);
    List<int> matches = [];

    int i = 0; // index for text[]
    int j = 0; // index for pattern[]
    while (i < N) {
      if (pattern[j] == text[i]) {
        j++;
        i++;
      }
      if (j == M) {
        matches.add(i - j);
        j = lps[j - 1];
      } else if (i < N && pattern[j] != text[i]) {
        if (j != 0) {
          j = lps[j - 1];
        } else {
          i = i + 1;
        }
      }
    }
    return matches;
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: WardrobeCategory.values.length, vsync: this);

    super.initState();
    // Initialize wardrobeList with your Wardrobe data
    wardrobeList = KSWardrobe().generateWardrobeList();
    // Make sure the list is sorted for interpolation search

    // wardrobeList.sort((a, b) =>
    //     a.wardrobeName.toLowerCase().compareTo(b.wardrobeName.toLowerCase()));

    //LIST WARDROBE NAME

    searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
    searchController.dispose();
    super.dispose();
  }

  //normal search

  // onSearchChanged() {
  //   if (searchController.text.isEmpty) {
  //     setState(() {
  //       searchResults.clear();
  //     });
  //   } else {
  //     setState(() {
  //       searchResults = wardrobeList
  //           .where((wardrobe) => wardrobe.wardrobeName
  //               .toLowerCase()
  //               .contains(searchController.text.toLowerCase()))
  //           .toList();
  //     });
  //   }
  // }

  //interpolation method
  // onSearchChanged() {
  //   // Sort the list if it's not already sorted in a case-insensitive manner

  //   String searchQuery = searchController.text.toLowerCase();

  //   if (searchQuery.isEmpty) {
  //     setState(() {
  //       searchResults.clear();
  //     });
  //   } else {
  //     int index = caseInsensitiveInterpolationSearch(wardrobeList, searchQuery);
  //     setState(
  //       () {
  //         if (index != -1) {
  //           // If the item is found, display only that item
  //           searchResults = [wardrobeList[index]];
  //         } else {
  //           setState(() {
  //             searchResults.clear();
  //           });
  //         }
  //       },
  //     );
  //   }
  // }

  // void onSearchChanged() {
  //   String searchQuery = searchController.text.toLowerCase();

  //   if (searchQuery.isEmpty) {
  //     setState(() {
  //       searchResults.clear();
  //     });
  //   } else {
  //     int index = caseInsensitiveInterpolationSearch(wardrobeList, searchQuery);
  //     setState(() {
  //       if (index != -1) {
  //         // If the item is found, display only that item
  //         searchResults = [wardrobeList[index]];
  //       } else {
  //         // If the item is not found, clear the search results and show 'no item found'
  //         searchResults.clear();
  //       }
  //     });
  //   }
  // }

  //KMP METHOD
  // void onSearchChanged() {
  //   String searchQuery = searchController.text.toLowerCase();

  //   if (searchQuery.isEmpty) {
  //     setState(() {
  //       searchResults.clear();
  //     });
  //   } else {
  //     // Convert your wardrobeList to a single string for searching.
  //     String wardrobeString = wardrobeList
  //         .map((wardrobe) => wardrobe.wardrobeName.toLowerCase())
  //         .join(' ');

  //     // Perform KMP search.
  //     List<int> matches = KMPSearch(wardrobeString, searchQuery);

  //     // Convert match positions back to a list of Wardrobe items.
  //     setState(() {
  //       searchResults = matches.map((index) => wardrobeList[index]).toList();
  //     });
  //   }
  // }

  //On Seach Function
  void onSearchChanged() {
    String searchQuery = searchController.text.toLowerCase();

    if (searchQuery.isEmpty) {
      setState(() {
        searchResults.clear();
      });
    } else {
      // Perform KMP search for each item in the wardrobeList.
      // This will hold the indices of the items that match the search query.
      List<int> matchingIndices = [];

      // Convert search query to lowercase for case-insensitive search.
      for (int i = 0; i < wardrobeList.length; i++) {
        String itemName = wardrobeList[i].wardrobeName.toLowerCase();
        // Use the KMP algorithm to check for a match.
        List<int> kmpResult = KMPSearch(itemName, searchQuery);
        // If there are matches, add the index to matchingIndices.
        if (kmpResult.isNotEmpty) {
          matchingIndices.add(i);
        }
      }

      // Update searchResults with the items that match the search query.
      setState(() {
        searchResults =
            matchingIndices.map((index) => wardrobeList[index]).toList();
      });
    }
  }

  //filters the items in its desired cateogry
  List<Wardrobe> _filterMenuByCategory(
      WardrobeCategory category, List<Wardrobe> fullMenu) {
    return fullMenu.where((wardrobe) => wardrobe.category == category).toList();
  }

  // List<Widget> getWardrobeInThisCategory(List<Wardrobe> fullMenu) {
  //   return WardrobeCategory.values.map((category) {
  //     List<Wardrobe> categoryMenu = searchResults.isNotEmpty
  //         ? searchResults
  //             .where((wardrobe) => wardrobe.category == category)
  //             .toList()
  //         : _filterMenuByCategory(category, fullMenu);

  //     categoryMenu.sort((a, b) => a.wardrobeName.compareTo(b.wardrobeName));

  //     return searchResults.isEmpty && searchController.text.isNotEmpty
  //         ? const Center(child: Text('No Item Found'))
  //         : SizedBox(
  //             width: MediaQuery.of(context).size.width,
  //             height: MediaQuery.of(context).size.height,
  //             child: GridView.builder(
  //               itemCount: categoryMenu.length,
  //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: 2,
  //               ),
  //               physics: const NeverScrollableScrollPhysics(),
  //               itemBuilder: (context, index) {
  //                 final wardrobe = categoryMenu[index];

  //                 return Card(
  //                   color: Colors.grey.shade100,
  //                   child: ListTile(
  //                     title: MyWardrobeTile(
  //                       onTap: () => Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => MyWardrobeDescPage(
  //                             wardrobe: wardrobe,
  //                           ),
  //                         ),
  //                       ),
  //                       wardrobe: wardrobe,
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           );
  //   }).toList();
  // }
  Future<List<Wardrobe>> fetchWardrobe() async {
    // Replace the next line with your actual code to fetch the wardrobe data.
    // This could be a network request, a database query, etc.
    // Make sure this function returns a Future<List<Wardrobe>>.
    return Future.value(wardrobeList);
  }

  List<Widget> getWardrobeInThisCategory(List<Wardrobe> fullMenu) {
    return WardrobeCategory.values.map((category) {
      return FutureBuilder<List<Wardrobe>>(
        future: fetchWardrobe(), // your async function to fetch data
        builder:
            (BuildContext context, AsyncSnapshot<List<Wardrobe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // or some kind of loading spinner
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Wardrobe> categoryMenu = searchResults.isNotEmpty
                  ? searchResults
                      .where((wardrobe) => wardrobe.category == category)
                      .toList()
                  : _filterMenuByCategory(category, fullMenu);

              categoryMenu
                  .sort((a, b) => a.wardrobeName.compareTo(b.wardrobeName));

              return searchResults.isEmpty && searchController.text.isNotEmpty
                  ? const Center(child: Text('No Item Found'))
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        itemCount: categoryMenu.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final wardrobe = categoryMenu[index];

                          return Card(
                            color: Colors.grey.shade100,
                            child: ListTile(
                              title: MyWardrobeTile(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyWardrobeDescPage(
                                      wardrobe: wardrobe,
                                    ),
                                  ),
                                ),
                                wardrobe: wardrobe,
                              ),
                            ),
                          );
                        },
                      ),
                    );
            }
          }
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            actions: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyTransactionPageCategorized(),
                ),
              ),
            ),
            title: MyWardrobeTabBar(tabController: _tabController),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: MyTextField_Search(
                    hintText: "Sear...",
                    obscureText: false,
                    controller: searchController,
                  ),
                ),
              ],
            ),
          ),
        ],
        body: Expanded(
          child: Consumer<KSWardrobe>(
            builder: (context, kswardrobe, child) => TabBarView(
              controller: _tabController,
              children: getWardrobeInThisCategory(kswardrobe.menu),
            ),
          ),
        ),
      ),
    );
  }
}
