import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api_service.dart';
import 'model_products.dart';

class ScreenHomepage extends StatefulWidget {
  @override
  State<ScreenHomepage> createState() => _ScreenHomepageState();
}

class _ScreenHomepageState extends State<ScreenHomepage> {
  bool isGridView = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<ModelProducts> products = Provider.of<List<ModelProducts>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Air Duka Interview'),

      ),
      body: Container(
          padding: EdgeInsets.all(16),
          child: isGridView ? _gridview(products) : _listview(products)),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          if(isGridView){
            isGridView = false;
          }else{
            isGridView = true;
          }
          print(isGridView);
        });
      },
      child: Icon(isGridView?Icons.format_list_bulleted:Icons.grid_view_rounded),),
    );
  }

  Widget _gridview(List<ModelProducts> products) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemBuilder: (BuildContext context, int index) {
        ModelProducts product = products[index];
        return Container(
          margin: EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.featured_image,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: Container(
                          color: Colors.grey,
                          height: 300,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 4,
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  '${product.title}',
                  style: TextStyle(fontSize: 12),
                ),
              ),

              Flexible(
                flex: 1,
                child: Text(
                  'Ksh ${product.price}',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),

              Flexible(
                flex: 1,
                child: Text(
                  '${product.company}',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ),

            ],
          ),
        );
      },
    );
  }

  Widget _listview(List<ModelProducts> products) {
    return products.isNotEmpty
        ? ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              ModelProducts product = products[index];
              return Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.featured_image,
                        fit: BoxFit.fill,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: Container(
                              color: Colors.grey,
                              height: 300,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${product.title}',
                      style: TextStyle(fontSize: 14),
                    ),

                    Text(
                      'Ksh ${product.price}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),

                    Text(
                      '${product.company}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      height: 2.0,
                    ),
                  
                  ],
                ),
              );
            })
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
