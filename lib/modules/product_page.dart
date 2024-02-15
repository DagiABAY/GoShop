import 'package:flutter/material.dart';
import 'package:goshop/model/product.dart';
import 'package:goshop/modules/product_detail.dart';
import 'package:goshop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cart");
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 50,
              semanticLabel: "Cart",
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Card(
              color: Color(0xff7066FF),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      child: Image(
                        image: AssetImage("assets/images/homei.png"),
                        height: 350,
                        width: 400,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Your Favourites",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w100),
                        ),
                        Text(
                          "10+ Products",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(PRODUCTS.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ProductDetal(
                          product: PRODUCTS[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            PRODUCTS[index].image,
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    PRODUCTS[index].name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${PRODUCTS[index].price.toString()}\$ ",
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        "${(PRODUCTS[index].price + 100)} \$",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  var product = PRODUCTS[index];
                                  setState(() {
                                    product.favorite = !product.favorite;
                                    if (product.favorite == true) {
                                      cartProvider.add(product);
                                    } else {
                                      cartProvider.removeProduct(product);
                                    }
                                  });
                                },
                                child: Icon(
                                  PRODUCTS[index].favorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: PRODUCTS[index].favorite
                                      ? Colors.red
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
