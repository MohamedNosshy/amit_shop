import 'package:amit_shope/utils/Configs.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {


  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding:  EdgeInsets.only(
          top: size.height * 0.01,
        ),
        child: ListView.separated(
          itemBuilder: (context,index) =>  Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.01
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(
                      "${Configs.shopingcart[index].avatar}"),
                  width: size.width * 0.3,
                  height: size.height * 0.13,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${Configs.shopingcart[index].title}',
                        style: TextStyle(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                          height: size.height * 0.005
                      ),
                      Text(
                        '${Configs.shopingcart[index].name}',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: size.width * 0.032,
                            decoration: TextDecoration.none),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${Configs.shopingcart[index].price! * Configs.shopingcart[index].amount!} EGP',
                            style: TextStyle(
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.w900,
                                color: Colors.redAccent,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Container(
                            width: size.width * 0.07,
                            height: size.height * 0.04,
                            child: FloatingActionButton(
                              heroTag: "${Configs.shopingcart[index].id}",
                              onPressed: ()
                              {
                                setState(()
                                {
                                  Configs.shopingcart[index].amount = Configs.shopingcart[index].amount! +1;
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
                            width: size.height * 0.01,
                          ),
                          Container(
                            width: size.width * 0.16,
                            height: size.height * 0.045,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                            ),
                            child: Center(
                              child: Text(
                                '${Configs.shopingcart[index].amount!}',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.height * 0.01,
                          ),
                          Container(
                            width: size.width * 0.07,
                            height: size.height * 0.04,
                            child: FloatingActionButton(
                              heroTag: "${Configs.shopingcart[index].id}",
                              onPressed: ()
                              {
                                if(Configs.shopingcart[index].amount! > 1)
                                {
                                  setState(() {
                                    Configs.shopingcart[index].amount = Configs.shopingcart[index].amount! -1;
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
                    ],
                  ),
                )
              ],
            ),
          ),
          separatorBuilder: (context,index) =>  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: size.width * 0.95,
                height: size.height * 0.003,
                color: Colors.black12,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
          itemCount: Configs.shopingcart.length,
          shrinkWrap: true,
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(
            top: size.height * 0.01,
            bottom: size.height * 0.01
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: MaterialButton(
                onPressed: ()
                {
                  Configs.shopingcart.clear();
                  setState(() {

                  });
                },
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 3.0)
                      ],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text(
                      'Clear Cart',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.04,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 3.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text(
                      'Go To Check Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.04,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
