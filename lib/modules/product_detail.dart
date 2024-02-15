import 'package:flutter/material.dart';
import 'package:goshop/model/product.dart';
import 'package:goshop/modules/success_buy.dart';
import 'package:goshop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetal extends StatefulWidget {
  final Product product;
  const ProductDetal({super.key, required this.product});

  @override
  State<ProductDetal> createState() => _ProductDetalState();
}

class _ProductDetalState extends State<ProductDetal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartProvider>(builder: (context, provider, _) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              widget.product.name == "Laptop"
                  ? const Image(
                      image: AssetImage("assets/images/laptop.png"),
                    )
                  : widget.product.name == "Phone"
                      ? const Image(
                          image: AssetImage("assets/images/smartphone.png"),
                          height: 300,
                          width: 400,
                        )
                      : widget.product.name == "Watch"
                          ? const Image(
                              image: AssetImage("assets/images/applewatch.png"),
                              height: 300,
                              width: 400,
                            )
                          : widget.product.name == "TV"
                              ? const Image(
                                  image: AssetImage("assets/images/4ktv.png"),
                                  height: 300,
                                  width: 400,
                                )
                              : widget.product.name == "Drone Camera"
                                  ? const Image(
                                      image: AssetImage(
                                          "assets/images/cameradrone.png"),
                                      height: 300,
                                      width: 400,
                                    )
                                  : widget.product.name == "Desktop PC"
                                      ? const Image(
                                          image: AssetImage(
                                              "assets/images/desktop.png"),
                                          height: 300,
                                          width: 400,
                                        )
                                      : const Image(
                                          image: AssetImage(
                                              "assets/images/speaker.png"),
                                          height: 300,
                                          width: 400,
                                        ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  widget.product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "\$${widget.product.price}",
                      style: const TextStyle(fontSize: 35),
                    ),
                    Text(
                      "${(widget.product.price + 100)} \$",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "75% off",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(18.0, 0, 18.0, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      color: Colors.red,
                    ),
                    Text(
                      "11 hours left at this price!",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _checkAleadyInCart()
                          ? ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  "/cart",
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                                  textStyle: const MaterialStatePropertyAll(
                                      TextStyle(fontSize: 50)),
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size.fromWidth(370)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                    Color(0xff7066FF),
                                  ),
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(vertical: 20))),
                              child: const Text(
                                "Go to Cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ))
                          : ElevatedButton(
                              onPressed: () {
                                provider.add(widget.product);
                                Navigator.pushNamed(
                                  context,
                                  "/cart",
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  textStyle: const MaterialStatePropertyAll(
                                      TextStyle(fontSize: 50)),
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size.fromWidth(370)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                    Color(0xff7066FF),
                                  ),
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(vertical: 20))),
                              child: const Text(
                                "Add to Cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                      const SizedBox(
                        height: 18,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const SuccessBuy(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                              side: const MaterialStatePropertyAll(
                                  BorderSide(color: Colors.black)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              fixedSize: const MaterialStatePropertyAll(
                                  Size.fromWidth(370)),
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(vertical: 20),
                              ),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.white)),
                          child: const Text("Buy Now")),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        );
      }),
    );
  }

  bool _checkAleadyInCart() {
    CartProvider provider = Provider.of<CartProvider>(context, listen: false);
    return provider.products.any((element) => element.id == widget.product.id);
  }
}
