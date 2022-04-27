import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_configuration/global_configuration.dart';

import 'package:teatime/bloc/cart/cart_cubit.dart';
import 'package:teatime/bloc/stock/stock_cubit.dart';
import 'package:teatime/database/database.dart';
import 'package:teatime/database/stock_database.dart';

import 'package:teatime/screens/splash_screen.dart';

import 'bloc/products/products_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("test_configurations");
  runApp(RepositoryProvider(
      create: (context) => MyDatabase(),
      child: RepositoryProvider(
        create: (context) => Stockdatabase(),
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit()..getCart(context),
        ),
        BlocProvider(
          create: (context) => StockCubit()..getStock(context),
        ),
        BlocProvider(create: (context) => ProductsCubit()),
      ],
      child: MaterialApp(
        title: 'Teatime PO',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
