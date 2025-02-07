import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  _ProductListingPageState createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  final SupabaseClient supabase = Supabase.instance.client;

  final int pageSize = 10;
  int currentPage = 0;
  List<Map<String, dynamic>> products = [];
  bool isLoading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    if (isLoading || !hasMore) return;

    setState(() => isLoading = true);

    final response = await supabase
        .from('products')
        .select()
        .order('created_at', ascending: false)
        .range(currentPage * pageSize, (currentPage + 1) * pageSize - 1);

    if (response.isEmpty) {
      setState(() => hasMore = false);
    } else {
      setState(() {
        products.addAll(response);
        currentPage++;
      });
    }

    setState(() => isLoading = false);
  }

  Future<void> addProduct() async {
    await supabase.from('products').insert({
      'name': 'New Product ${products.length + 1}',
      'available_quantity': 100,
      'price': 999.99,
    });

    setState(() {
      products.clear();
      currentPage = 0;
      hasMore = true;
    });

    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length + (hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == products.length) {
                  fetchProducts();
                  return const Center(child: CircularProgressIndicator());
                }

                final product = products[index];
                return ListTile(
                  title: Text(product['name']),
                  subtitle: Text(
                      'Quantity: ${product['available_quantity']} | Price: ₹${product['price']}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: addProduct,
              child: const Text('Add Product'),
            ),
          ),
        ],
      ),
    );
  }
}
