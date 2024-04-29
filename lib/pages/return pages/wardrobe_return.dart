import 'package:app/models/item/wardrobelist.dart';
import 'package:app/models/kstransactions/kstransaction_wardrobe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWardrobeReturn extends StatefulWidget {
  final Wardrobe wardrobe;
  const MyWardrobeReturn({super.key, required this.wardrobe});

  @override
  State<MyWardrobeReturn> createState() => _MyWardrobeReturnState();
}

class _MyWardrobeReturnState extends State<MyWardrobeReturn> {
  @override
  Widget build(BuildContext context) {
    return Consumer<KSTransaction>(
      builder: (context, transactionvalue, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(widget.wardrobe.wardrobeName),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  widget.wardrobe.wardrobeImagePath,
                  height: 200,
                ),
                Text(
                  widget.wardrobe.wardrobeName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //SIZED BOX
                const SizedBox(
                  height: 20,
                ),
                //DATE SELECTION

                //SIZED BOX

                //ITEM SELECTION

                //SIZED BOX
              ],
            ),
          ),
        ),
      ),
    );
  }
}
