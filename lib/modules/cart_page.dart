import 'package:flutter/material.dart';
import 'package:goshop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Consumer<CartProvider>(
        builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Stack(children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    child: ListView.builder(
                      itemCount: provider.products.length,
                      itemBuilder: (context, index) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ListTile(
                              leading: provider.products[index].image,
                              title: Text(
                                provider.products[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                "\$${provider.products[index].price}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              onLongPress: () {
                                final RenderBox itemBox =
                                    context.findRenderObject() as RenderBox;
                                final Offset itemCenter = itemBox.localToGlobal(
                                    itemBox.size.center(Offset.zero));

                                final relativePosition = RelativeRect.fromLTRB(
                                  itemCenter.dx,
                                  itemCenter.dy,
                                  itemCenter.dx,
                                  itemCenter.dy,
                                );

                                showMenu<String>(
                                  context: context,
                                  position: relativePosition,
                                  items: [
                                    PopupMenuItem<String>(
                                      value: 'item1',
                                      child: ListTile(
                                        title: const Text("Remove From Cart"),
                                        onTap: () {
                                          provider.removeProduct(
                                              provider.products[index]);

                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Text(
                        "Total price:  ${provider.getTotalPrice()}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (provider.products.isEmpty) {
                              const snackBar = SnackBar(
                                content: Text('First Add some Product'),
                                duration: Duration(
                                    seconds:
                                        2), // Adjust the duration as needed
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "/success", (route) => false);
                            }
                          },
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              textStyle: const MaterialStatePropertyAll(
                                  TextStyle(fontSize: 50)),
                              fixedSize: const MaterialStatePropertyAll(
                                  Size.fromWidth(370)),
                              backgroundColor: const MaterialStatePropertyAll(
                                Color(0xff7066FF),
                              ),
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(vertical: 20))),
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                    ],
                  )),
            ]),
          );
        },
      ),
    );
  }
}
