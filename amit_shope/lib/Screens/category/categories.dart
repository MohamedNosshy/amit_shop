import 'package:amit_shope/Logic/API.dart';
import 'package:amit_shope/Models/categoriesVM.dart';
import 'package:amit_shope/Screens/filtered_items/filtered_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<CategoriesVm>(
        future: getItemsFun() ,
        builder: (context,snapshot)
        {
          if(snapshot.connectionState == ConnectionState.done)
          {
            if(snapshot.hasData)
            {
              return Scaffold(

                body: Container(
                  color: Colors.grey[200],
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.only(
                      top: size.height * 0.01,
                      left: size.width * 0.03,
                      right: size.width * 0.03),
                  child: GridView.builder(
                    itemCount: snapshot.data!.categories!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: size.width * 0.03, mainAxisSpacing: size.height * 0.02),
                    itemBuilder: (context, index) {
                      return  InkWell(
                        onTap: ()
                        {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => FilteredItems(selectedCategory: snapshot.data!.categories![index],)));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${snapshot.data!.categories![index].avatar}'),
                                  fit: BoxFit.cover,
                                )),
                            alignment: Alignment.center,
                            child: Container(
                              margin:
                              EdgeInsets.symmetric(horizontal: size.width * 0.03),
                              color: Colors.black45,
                              child: Text(
                                '${snapshot.data!.categories![index].name}',
                                // maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontSize: size.width * 0.055,
                                  // backgroundColor: Colors.black45,
                                ),
                              ),
                            )),
                      );
                    },
                  ),
                ),
              );
            }else
            {
              return Center(
                  child: Text(
                    "Please Check Internet Connection",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ));
            }
          }else
          {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          }
        }
    );
  }


  Future<CategoriesVm> getItemsFun() async {
    return await API.getItems();
  }


}
