import 'package:app/components/item_tile/book_item_tile.dart';
import 'package:app/components/sliver_app_bar/wardrobe_sliver_app_bar.dart';
import 'package:app/components/tab_bar/book_tab_bar.dart';
import 'package:app/components/textfields/my_sign_in_textfield.dart';
import 'package:app/models/inventory/ksbook.dart';
import 'package:app/models/item/booklist.dart';
import 'package:app/pages/second_page/book_borrow_return.dart';
import 'package:app/pages/transactions/transaction_categorized.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBookPage extends StatefulWidget {
  const MyBookPage({super.key});

  @override
  State<MyBookPage> createState() => _MyBookPageState();
}

class _MyBookPageState extends State<MyBookPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: BookCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Book> _filterMenuByCategory(BookCategory category, List<Book> fullMenu) {
    return fullMenu.where((book) => book.category == category).toList();
  }

  List<Widget> getBookInThisCategory(List<Book> fullMenu) {
    return BookCategory.values.map((category) {
      List<Book> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return GridView.builder(
        itemCount: categoryMenu.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final book = categoryMenu[index];

          return Card(
            color: Colors.grey.shade100,
            child: ListTile(
              title: MyBookTile(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBookDescPage(
                      book: book,
                    ),
                  ),
                ),
                book: book,
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
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyTransactionPageCategorized(),
                ),
              ),
            ),
            title: MyBookTabBar(tabController: _tabController),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: MyTextField_Rectangle(
                    hintText: "Search",
                    obscureText: false,
                  ),
                ),
              ],
            ),
          ),
        ],
        body: Expanded(
          child: Consumer<KSBook>(
            builder: (context, ksbook, child) => TabBarView(
              controller: _tabController,
              children: getBookInThisCategory(ksbook.menu),
            ),
          ),
        ),
      ),
    );
  }
}
