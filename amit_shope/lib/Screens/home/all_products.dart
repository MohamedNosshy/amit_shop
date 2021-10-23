import 'package:amit_shope/Logic/API.dart';
import 'package:amit_shope/Models/productsVM.dart';
import 'package:amit_shope/Screens/show_product/show_product.dart';
import 'package:amit_shope/utils/Configs.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<ProductsVm>(
        future: getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Container(
                color: Colors.grey[200],
                width: size.width,
                height: size.height,
                padding: EdgeInsets.only(
                    top: size.height * 0.01,
                    left: size.width * 0.02,
                    right: size.width * 0.02),
                child: GridView.builder(
                  itemCount: snapshot.data!.products!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: size.width * 0.03,
                      mainAxisSpacing: size.height * 0.02),
                  itemBuilder: (context, index) {
                    return Scaffold(
                      body: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailes(
                                      selectedItem:
                                      snapshot.data!.products![index])));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            top: size.height * 0.002,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 100,
                                child: Image(
                                  image: NetworkImage(
                                      '${snapshot.data!.products![index].avatar}'),
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.009,
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: size.width * 0.008),
                                child: Text(
                                  '${snapshot.data!.products![index].title}',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w900,
                                      fontSize: size.width * 0.04,
                                      color: Colors.black),
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.003,
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: size.width * 0.009),
                                child: Text(
                                  '${snapshot.data!.products![index].name}',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w900,
                                      fontSize: size.width * 0.03,
                                      color: Colors.black54),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.02,
                                    right: size.width * 0.015,
                                    top: size.height * 0.007),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: size.width * 0.07,
                                      height: size.height * 0.035,
                                      child: FloatingActionButton(
                                        heroTag:
                                        "${snapshot.data!.products![index].id}",
                                        onPressed: () {
                                          snapshot.data!.products![index]
                                              .amount = 1;
                                          Configs.shopingcart.add(
                                              snapshot.data!.products![index]);
                                        },
                                        child: Icon(
                                          Icons.add,
                                        ),
                                        mini: true,
                                        backgroundColor: Colors.redAccent,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.12,
                                    ),
                                    Text(
                                      '${snapshot.data!.products![index].price} EGP',
                                      style: TextStyle(
                                          fontSize: size.width * 0.045,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.redAccent,
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(
                  child: Text(
                    "Please Check Internet Connection",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ));
            }
          } else {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          }
        });
  }

  Future<ProductsVm> getAllProducts() async {
    return await API.getProduct();
  }
}
