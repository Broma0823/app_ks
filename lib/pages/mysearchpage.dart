import 'package:app/components/textfields/my_appbar_search_textfield.dart';
import 'package:app/models/item/accesorieslist.dart';
import 'package:app/models/item/instrumentlist.dart';
import 'package:app/models/item/wardrobelist.dart';
import 'package:app/pages/second_page/accesories_borrow_return.dart';
import 'package:app/pages/second_page/instrument_borrow_return.dart';
import 'package:app/pages/second_page/wardrobe_borrow_return.dart';
import 'package:flutter/material.dart';

class HomePageSearch extends StatefulWidget {
  final List<Wardrobe> wardrobeItems;
  final List<Accesories> accesoriesItems;
  final List<Instrument> instrumentItems;

  HomePageSearch({
    required this.wardrobeItems,
    required this.accesoriesItems,
    required this.instrumentItems,
  });

  @override
  State<HomePageSearch> createState() => _HomePageSearchState();
}

class _HomePageSearchState extends State<HomePageSearch> {
  TextEditingController _searchController = TextEditingController();

  List<dynamic> _searchResults = [];

  List<dynamic> allItems = [];

  //KMP ALGO
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

  void onSearchChanged() {
    String searchQuery = _searchController.text.toLowerCase();

    if (searchQuery.isEmpty) {
      setState(() {
        _searchResults.clear();
      });
    } else {
      List<int> matchingIndices = [];

      for (int i = 0; i < allItems.length; i++) {
        // You need to determine how to get the name based on the item type
        String itemName = getItemName(allItems[i]).toLowerCase();
        List<int> kmpResult = KMPSearch(itemName, searchQuery);
        if (kmpResult.isNotEmpty) {
          matchingIndices.add(i);
        }
      }

      setState(() {
        _searchResults =
            matchingIndices.map((index) => allItems[index]).toList();
      });
    }
  }

  String getItemName(dynamic item) {
    if (item is Wardrobe) {
      return item.wardrobeName;
    } else if (item is Accesories) {
      return item.accesoriesName;
    } else if (item is Instrument) {
      return item.instrumentName;
    } else {
      return ''; // Or handle unknown item type
    }
  }

  @override
  void initState() {
    super.initState();
    // Combine all items into a single list
    allItems = [
      ...widget.wardrobeItems,
      ...widget.accesoriesItems,
      ...widget.instrumentItems
    ];

    _searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allItems = [
      ...widget.wardrobeItems,
      ...widget.accesoriesItems,
      ...widget.instrumentItems
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: MySearchFieldAppBar(
          hintText: 'Search...',
          obscureText: false,
          controller: _searchController,
          autofocus: true,
        ),
        backgroundColor:
            Colors.transparent, // Optional: for a transparent AppBar
        elevation: 0, // Optional: remove shadow
      ),
      body: Column(
        children: [
          Expanded(
            child: _searchController.text.isNotEmpty && _searchResults.isEmpty
                ? Center(
                    child: Text('No Item Found'),
                  ) // This will display an empty container when the search field is empty
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                    ),
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final item = _searchResults[index];
                      return buildItemCard(
                        item,
                        context,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildItemCard(dynamic item, BuildContext context) {
    String name;
    String description;
    String imagePath;
    VoidCallback onTap = () {};

    if (item is Wardrobe) {
      name = item.wardrobeName;
      description = item.wardrobeDescription;
      imagePath = item.wardrobeImagePath;
      onTap = () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyWardrobeDescPage(wardrobe: item)));
      };
    } else if (item is Accesories) {
      name = item.accesoriesName;
      description = item.accesoriesDescription;
      imagePath = item.accesoriesImagePath;
      onTap = () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyAccesoriesDescPage(accesories: item)));
      };
    } else if (item is Instrument) {
      name = item.instrumentName;
      description = item.instrumentDescription;
      imagePath = item.instrumentImagePath;
      onTap = () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyInstrumentDescPage(instrument: item)));
      };
    } else {
      // Handle unknown item type
      name = 'Unknown';
      description = 'No description available';
      imagePath = 'assets/images/placeholder.png';
    }

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).cardTheme.color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              Text(name),
            ],
          ),
        ),
      ),
    );
  }
}
