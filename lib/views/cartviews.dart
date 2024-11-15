import 'package:flutter/material.dart';
import 'package:myapp/model/CartModel.dart';
import 'package:myapp/services/CartServices.dart';

class CartViews extends StatefulWidget {
  const CartViews({super.key});

  @override
  State<CartViews> createState() => _CartViewsState();
}

class _CartViewsState extends State<CartViews> {
  //fungsi untuk mengambil data cart
  late Future<List<CartModel>> futureCarts;

  @override
  void initState() {
    futureCarts = CartServices().fetchCarts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<CartModel>>(
        future: futureCarts,
        builder: (context, snapshot) {
          //jika data waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Carts Found'),
            );
          } else {
            List<CartModel> carts = snapshot.data!;
            return ListView.builder(
              itemCount: carts.length,
              itemBuilder: (context, index) {
                CartModel cart = carts[index];
                return Card(
                  color: const Color.fromARGB(255, 219, 212, 212),
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('Cart ID: ${cart.id}'),
                    subtitle: Text('date : ${cart.date}'),
                    trailing: Text('Total Products: ${cart.products!.length}'),
                    onTap: () => _showDetails(cart),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _showDetails(CartModel cart) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Cart Id: ${cart.id}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: cart.products!.map((product) {
              return Text(
                'Product ID: ${product.productId}, Quantity: ${product.quantity}',
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
