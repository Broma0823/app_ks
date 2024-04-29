import 'package:app/components/item_tile/instrument_item_tile.dart';
import 'package:app/components/sliver_app_bar/wardrobe_sliver_app_bar.dart';
import 'package:app/components/tab_bar/instrument_tab_bar.dart';
import 'package:app/components/textfields/my_search_textfield.dart';
import 'package:app/models/inventory/ksinstrument.dart';
import 'package:app/models/item/instrumentlist.dart';
import 'package:app/pages/second_page/instrument_borrow_return.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyInstrumentPage extends StatefulWidget {
  const MyInstrumentPage({super.key});

  @override
  State<MyInstrumentPage> createState() => _MyInstrumentPageState();
}

final item = [""];

class _MyInstrumentPageState extends State<MyInstrumentPage>
    with SingleTickerProviderStateMixin {
  //TAB CONTROLLER
  late TabController _tabController;
  //SEARCH CONTROLLER
  TextEditingController searchController = TextEditingController();

  List<Instrument> searchResults = [];
  List<Instrument> instrumentList = [];

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
        TabController(length: InstrumentCategory.values.length, vsync: this);
    super.initState();
    instrumentList = KSInstrument().generateInstrumentList();

    searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
    searchController.dispose();
    super.dispose();
  }

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
      for (int i = 0; i < instrumentList.length; i++) {
        String itemName = instrumentList[i].instrumentName.toLowerCase();
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
            matchingIndices.map((index) => instrumentList[index]).toList();
      });
    }
  }

  List<Instrument> _filterMenuByCategory(
      InstrumentCategory category, List<Instrument> fullMenu) {
    return fullMenu
        .where((instrument) => instrument.instrumentCategory == category)
        .toList();
  }

  List<Widget> getInstrumentInThisCategory(List<Instrument> fullMenu) {
    return InstrumentCategory.values.map((category) {
      List<Instrument> categoryMenu = searchResults.isNotEmpty
          ? searchResults
              .where((instrument) => instrument.instrumentCategory == category)
              .toList()
          : _filterMenuByCategory(category, fullMenu);

      categoryMenu.sort((a, b) => a.instrumentName.compareTo(b.instrumentName));

      return searchResults.isEmpty && searchController.text.isNotEmpty
          ? const Center(child: Text('No Item Found'))
          : GridView.builder(
              itemCount: categoryMenu.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final instrument = categoryMenu[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyInstrumentDescPage(
                                instrument: instrument,
                              )),
                    );
                  },
                  child: Card(
                    color: Theme.of(context).cardTheme.color,
                    child: ListTile(
                      title: MyInstrumentTile(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyInstrumentDescPage(
                              instrument: instrument,
                            ),
                          ),
                        ),
                        instrument: instrument,
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
            title: MyInstrumentTabBar(tabController: _tabController),
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
          child: Consumer<KSInstrument>(
            builder: (context, ksinstrument, child) => TabBarView(
              controller: _tabController,
              children: getInstrumentInThisCategory(ksinstrument.menu),
            ),
          ),
        ),
      ),
    );
  }
}
