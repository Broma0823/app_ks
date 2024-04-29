//import 'package:app/pages/homepage.dart';
import 'package:app/models/inventory/ksaccesories.dart';
import 'package:app/models/inventory/ksbook.dart';
import 'package:app/models/inventory/ksinstrument.dart';
import 'package:app/models/inventory/kswardrobe.dart';
import 'package:app/models/kstransactions/ks_transaction_instrument.dart';
import 'package:app/models/kstransactions/kstransaction_accesories.dart';
import 'package:app/models/kstransactions/kstransaction_book.dart';
import 'package:app/models/kstransactions/kstransaction_wardrobe.dart';
import 'package:app/pages/login/authentication.dart';
import 'package:app/theme/theme.dart';
import 'package:app/theme/themeprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => KSTransactionInstrument(),
        ),
        ChangeNotifierProvider(
          create: (context) => KSTransactionAccesories(),
        ),
        ChangeNotifierProvider(
          create: (context) => KSTransactionBook(),
        ),
        ChangeNotifierProvider(
          create: (context) => KSBook(),
        ),
        ChangeNotifierProvider(
          create: (context) => KSInstrument(),
        ),
        ChangeNotifierProvider(
          create: (context) => KSTransaction(),
        ),
        ChangeNotifierProvider(
          create: (context) => KSAccesories(),
        ),
        ChangeNotifierProvider(
          create: (context) => KSWardrobe(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(fontFamily: 'oten'),
      themeMode: ThemeMode.system,
      theme: Provider.of<ThemeProvider>(context).themeData,
      darkTheme: darkTheme,

      debugShowCheckedModeBanner: false,

      home: const AuthenticationPage(),
    );
  }
}
