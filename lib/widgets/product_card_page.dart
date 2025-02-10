import 'package:flutter/material.dart';

// class ProductCard extends StatefulWidget {
//   final String productName;
//   final String productPrice;
//   final String productImage;
//   final Function(String, int) onQuantityChanged;

//   const ProductCard({
//     Key? key,
//     required this.productName,
//     required this.productPrice,
//     required this.productImage,
//     required this.onQuantityChanged,
//   }) : super(key: key);

//   @override
//   _ProductCardState createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   int quantity = 0;

//   void _increaseQuantity() {
//     setState(() {
//       quantity++;
//     });
//     widget.onQuantityChanged(widget.productName, quantity);
//   }

//   void _decreaseQuantity() {
//     if (quantity > 0) {
//       setState(() {
//         quantity--;
//       });
//       widget.onQuantityChanged(widget.productName, quantity);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       elevation: 2,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.network(widget.productImage,
//               height: 120, width: double.infinity, fit: BoxFit.cover),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.productName,
//                   style: const TextStyle(
//                       fontSize: 14, fontWeight: FontWeight.bold),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   widget.productPrice,
//                   style: const TextStyle(fontSize: 14, color: Colors.green),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.remove, color: Colors.red),
//                       onPressed: _decreaseQuantity,
//                     ),
//                     Text(quantity.toString(),
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold)),
//                     IconButton(
//                       icon: const Icon(Icons.add, color: Colors.green),
//                       onPressed: _increaseQuantity,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ProductCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  final VoidCallback onAddToCart;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(productImage,
              height: 120, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  productPrice,
                  style: const TextStyle(fontSize: 14, color: Colors.green),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.add_shopping_cart,
                        color: Colors.orange),
                    onPressed: onAddToCart,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
