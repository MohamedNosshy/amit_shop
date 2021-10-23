import 'package:amit_shope/Models/productsVM.dart';
import 'package:amit_shope/utils/Configs.dart';
import 'package:flutter/material.dart';

class ProductDetailes extends StatefulWidget {
  Product selectedItem;
  ProductDetailes({required this.selectedItem});


  @override
  _ProductDetailesState createState() => _ProductDetailesState();
}

class _ProductDetailesState extends State<ProductDetailes> {


  @override
  void initState()
  {
    widget.selectedItem.amount = 1;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.03,
            right: size.width * 0.03,
            bottom: size.height * 0.02
        ),
        child: Container(
          width: size.width,
          height: size.height * 0.07,
          child: MaterialButton(
            onPressed: ()
            {
              Configs.shopingcart.add(widget.selectedItem);
              Navigator.pop(context);
            },
            color: Colors.redAccent,
            child: Text(
              'Add To Cart',
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top:size.height * 0.08,
          left: size.width * 0.03,
          right: size.width * 0.03,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage('${widget.selectedItem.avatar}'),
              fit: BoxFit.cover,
              height: size.height * 0.3,
              width: double.infinity,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Text('${widget.selectedItem.title}',
              style:TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold
              ),

            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text('${widget.selectedItem.name} ',
              style:TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold
              ),

            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Divider(
              color: Colors.black45,
              height: size.height * 0.01,
              thickness: 3,

            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                Text('${widget.selectedItem.price! * widget.selectedItem.amount!} EGP',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.06,
                    decoration: TextDecoration.none,

                  ),
                ),
                SizedBox(
                  width: size.width * 0.26,
                ),
                Container(
                  width: size.width * 0.08,
                  height: size.height * 0.05,
                  child: FloatingActionButton(
                    heroTag: "addToCart",
                    onPressed: ()
                    {
                      setState(()
                      {
                        widget.selectedItem.amount = widget.selectedItem.amount! + 1;
                      });
                    },
                    child: Icon(
                      Icons.add,
                    ),
                    mini: true,
                    backgroundColor: Colors.redAccent,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Container(
                  width: size.width * 0.17,
                  height:size.height * 0.05,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.selectedItem.amount!}',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Container(
                  width: size.width * 0.08,
                  height: size.height * 0.05,
                  child: FloatingActionButton(
                    heroTag: "2",
                    onPressed: ()
                    {
                      if(widget.selectedItem.amount! > 1)
                      {
                        setState(()
                        {
                          widget.selectedItem.amount = widget.selectedItem.amount! -1;
                        });
                      }
                    },
                    child: Icon(
                      Icons.remove,
                    ),
                    mini: true,
                    backgroundColor: Colors.redAccent,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(
              color: Colors.black45,
              height: size.height * 0.01,
              thickness: 3,

            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              '${widget.selectedItem.description != null ? widget.selectedItem.description : widget.selectedItem.name}',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: size.width * 0.035,

              ),

            ),
          ],
        ),
      ),
    );
  }
}
