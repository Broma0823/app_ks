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

class MyWardrobePage extends StatefulWidget {
  const MyWardrobePage({super.key});

  @override
  State<MyWardrobePage> createState() => _MyWardrobePageState();
}

class _MyWardrobePageState extends State<MyWardrobePage>
    with SingleTickerProviderStateMixin {
  //Tab Controller
  late TabController _tabController;

  //Search Controller
  TextEditingController searchController = TextEditingController();

  List<Wardrobe> searchResults = [];
  List<Wardrobe> wardrobeList = [];

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

    searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
    searchController.dispose();
    super.dispose();
  }

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

  List<Widget> getWardrobeInThisCategory(List<Wardrobe> fullMenu) {
    return WardrobeCategory.values.map((category) {
      List<Wardrobe> categoryMenu = searchResults.isNotEmpty
          ? searchResults
              .where((wardrobe) => wardrobe.category == category)
              .toList()
          : _filterMenuByCategory(category, fullMenu);

      categoryMenu.sort((a, b) => a.wardrobeName.compareTo(b.wardrobeName));

      return searchResults.isEmpty && searchController.text.isNotEmpty
          ? const Center(child: Text('No Item Found'))
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                itemCount: categoryMenu.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final wardrobe = categoryMenu[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyWardrobeDescPage(
                            wardrobe: wardrobe,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Theme.of(context).cardTheme.color,
                      // margin: EdgeInsets.all(4),
                      // shape: RoundedRectangleBorder(),
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
                    ),
                  );
                },
              ),
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
                    hintText: "Search...",
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
