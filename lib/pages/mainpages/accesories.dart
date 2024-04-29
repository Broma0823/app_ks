import 'package:app/components/item_tile/accesories_item_tile.dart';
import 'package:app/components/sliver_app_bar/wardrobe_sliver_app_bar.dart';
import 'package:app/components/tab_bar/accesories_tab_bar.dart';
import 'package:app/components/textfields/my_search_textfield.dart';
import 'package:app/models/inventory/ksaccesories.dart';
import 'package:app/models/item/accesorieslist.dart';
import 'package:app/pages/second_page/accesories_borrow_return.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccesoriesPage extends StatefulWidget {
  const MyAccesoriesPage({super.key});

  @override
  State<MyAccesoriesPage> createState() => _MyAccesoriesPageState();
}

class _MyAccesoriesPageState extends State<MyAccesoriesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  //SEARCH CONTROLLER
  TextEditingController searchController = TextEditingController();

  List<Accesories> searchResults = [];
  List<Accesories> accesoriesList = [];
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
        TabController(length: AccesoriesCategory.values.length, vsync: this);
    super.initState();
    accesoriesList = KSAccesories().generateInstrumentList();

    searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
    searchController.dispose();
    super.dispose();
  }

  //ON SEARCH FUNCTION
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
      for (int i = 0; i < accesoriesList.length; i++) {
        String itemName = accesoriesList[i].accesoriesName.toLowerCase();
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
            matchingIndices.map((index) => accesoriesList[index]).toList();
      });
    }
  }

  List<Accesories> _filterMenuByCategory(
      AccesoriesCategory category, List<Accesories> fullMenu) {
    return fullMenu
        .where((accesories) => accesories.category == category)
        .toList();
  }

  // List<Widget> getAccesoriesInThisCategory(List<Accesories> fullMenu) {
  //   return AccesoriesCategory.values.map((category) {
  //     List<Accesories> categoryMenu = _filterMenuByCategory(category, fullMenu);
  List<Widget> getAccesoriesInThisCategory(List<Accesories> fullMenu) {
    return AccesoriesCategory.values.map((category) {
      List<Accesories> categoryMenu = searchResults.isNotEmpty
          ? searchResults
              .where((wardrobe) => wardrobe.category == category)
              .toList()
          : _filterMenuByCategory(category, fullMenu);

      categoryMenu.sort((a, b) => a.accesoriesName.compareTo(b.accesoriesName));

      return searchResults.isEmpty && searchController.text.isNotEmpty
          ? const Center(child: Text('No Item Found'))
          : GridView.builder(
              itemCount: categoryMenu.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final accesories = categoryMenu[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAccesoriesDescPage(
                                accesories: accesories,
                              )),
                    );
                  },
                  child: Center(
                    child: Card(
                      color: Theme.of(context).cardTheme.color,
                      child: ListTile(
                        title: MyAccesoriesTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyAccesoriesDescPage(
                                accesories: accesories,
                              ),
                            ),
                          ),
                          accesories: accesories,
                        ),
                      ),
                    ),
                  ),
                );
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
              onPressed: () {},
            ),
            title: MyAccesoriesTabBar(tabController: _tabController),
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
          child: Consumer<KSAccesories>(
            builder: (context, ksaccesories, child) => TabBarView(
              controller: _tabController,
              children: getAccesoriesInThisCategory(ksaccesories.menu),
            ),
          ),
        ),
      ),
    );
  }
}
