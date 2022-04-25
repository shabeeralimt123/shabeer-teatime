import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teatime/bloc/products/products_cubit.dart';
import 'package:teatime/components/newStockSearchItem.dart';
import 'package:teatime/resources/theme_resources.dart';

class NewSearchResultWidget extends StatefulWidget {
  final String heroTag;

  NewSearchResultWidget({Key key, this.heroTag}) : super(key: key);

  @override
  _NewSearchResultWidgetState createState() => _NewSearchResultWidgetState();
}

class _NewSearchResultWidgetState extends State<NewSearchResultWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              trailing: IconButton(
                icon: Icon(Icons.close),
                color: ThemeColors.red,
                onPressed: () {
                  BlocProvider.of<ProductsCubit>(context)..getProducts();
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "Search",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              style: TextStyle(color: Colors.black),
              onSubmitted: (text) async {
                BlocProvider.of<ProductsCubit>(context)
                  ..getProducts(search: text);
              },
              onChanged: (val) async {
                BlocProvider.of<ProductsCubit>(context)
                  ..getProducts(search: val);
              },
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: "Search for Products",
                hintStyle: Theme.of(context).textTheme.caption.merge(TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    )),
                prefixIcon: Icon(Icons.search, color: ThemeColors.red),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsInitial) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is ProductsLoaded) {
                  return ListView( 
                    primary: true,
                    children: [
                      ...state.products
                          .map((e) => NewStockSearchItem(
                            productModel: e,
                          ))
                          .toList()
                    ],
                  );
                }
                if (state is ProductsError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ))
        ],
      ),
    );
  }
}
