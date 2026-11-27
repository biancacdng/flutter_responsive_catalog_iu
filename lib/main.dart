import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// MODEL
// ---------------------------------------------------------------------------
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imagePath,
    required this.description,
  });

  final int id;
  final String name;
  final double price;
  final String category;
  final String imagePath;
  final String description;
}

// ---------------------------------------------------------------------------
// DATA (shoes)
// ---------------------------------------------------------------------------
const List<Product> sampleProducts = [
  Product(
    id: 1,
    name: 'Nike',
    price: 5850.00,
    category: 'Running',
    imagePath:
        'https://runnr.com.ph/cdn/shop/files/IB1873-110.png?v=1780018013',
    description:
        'A lightweight upper and comfortable cushioning for a soft ride.',
  ),
  Product(
    id: 2,
    name: 'Adidas',
    price: 6700.00,
    category: 'Basketball',
    imagePath:
        'https://assets.adidas.com/images/w_500,f_auto,q_auto/056790d417364c60b7da1233fbae57fb_faec/BELIEVE_THAT_1_Trainers_Blue_JQ9475_db01_00_standard.tiff.jpg',
    description:
        'The D.O.N. Issue 7 Shoes is the latest signature shoe from adidas Basketball and superstar Donovan Mitchell.',
  ),
  Product(
    id: 3,
    name: 'Asics',
    price: 12500.00,
    category: 'Sneakers',
    imagePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRykVHIf3KVqM5YTCNqfVg-pORwsOBQ2XHh94l4djd8ew&s=10',
    description:
        'The GEL-KINETIC™ 2.0 sneaker combines Y3K design influences with advanced cushioning properties for everyday movements.',
  ),
  Product(
    id: 4,
    name: 'Salomon',
    price: 14350.00,
    category: 'Hiking',
    imagePath:
        'https://cdn.dam.salomon.com/d04f1b55-d60a-4993-82a0-b37800ccdd60/L49199100/PNG-2000px-max-72dpi.png?width=2918&fit=cover&optimize=medium&bg-color=f5f5f5&format=pjpg&auto=avif&pad=0.12%2C0.12%2C0.12%2C0.12',
    description:
        'A hiking shoe with modern ambitions, designed for the new outdoors – with modern lines, splashes of color and recycled materials in the textile upper. Drawing on a legacy of iconic X Ultra shoes, the X Ultra 360 Edge Gore-Tex continues to deliver all-terrain grip, stability and waterproof Gore-Tex protection on any adventure.',
  ),
  Product(
    id: 5,
    name: 'Vans',
    price: 7400.00,
    category: 'Casual',
    imagePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkXYpGkOQ1wSgbJhSO-UVOsf-75uf3-dpg9WMfAVxZXZdDkeQeXKkssDbN&s=10',
    description:
        'The Vans Authentic Seasonal Shoes deliver timeless low-top style with a low-cut style, traditional lace-up design, contrast stitching and signature waffle outsole for flexible everyday comfort and dependable grip.',
  ),
  Product(
    id: 6,
    name: 'New Balance',
    price: 5650.00,
    category: 'School',
    imagePath:
        'https://assets.footlocker.com/is/image/FLDM/316479446904_01?fmt=webp-alpha&bfc=on&wid=500&hei=500',
    description:
        'Originally built as a daily running shoe, the New Balance 740 pairs an open knit mesh upper with angular synthetic overlays and a segmented midsole',
  ),
  Product(
    id: 7,
    name: 'Kipsta',
    price: 13400.00,
    category: 'Futsal',
    imagePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT84Z9eXccTti8NnvHhmmmUft21Kq36mmSZRmwu6JMWTlYq6E_Fhb9P0ghO&s=10',
    description:
        'A pair of shoes that combine comfort, durability and a good feel for the ball.',
  ),
  Product(
    id: 8,
    name: 'Boots',
    price: 10400.00,
    category: 'Boots',
    imagePath:
        'https://cdn11.bigcommerce.com/s-s62r70/images/stencil/500x659/products/5948/21768/CA7568__85822.1752245658.jpg?c=2',
    description: 'new winter retro big yellow boots thick sole.',
  ),
  Product(
    id: 9,
    name: 'Birkenstock',
    price: 11000.00,
    category: 'Sandals',
    imagePath:
        'https://images-na.ssl-images-amazon.com/images/I/61-y7-WQiNL.jpg',
    description:
        'This simple sandal with two straps stands for timeless design and has long held cult status thanks to its comfort factor.',
  ),
  Product(
    id: 10,
    name: 'Puma',
    price: 6850.00,
    category: 'Skate',
    imagePath:
        'https://cdn.shopify.com/s/files/1/0753/7914/7034/files/38981801_1l.jpg?v=1794410166',
    description:
        'newest addition the the skate-style family: the C-Skate. This trainer features a stabilising low profile and a celebration of classic PUMA shapes to add a punch of attitude to this statement sneaker.',
  ),
];

// ---------------------------------------------------------------------------
// APP + THEME
// ---------------------------------------------------------------------------
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _mode = ThemeMode.light;
  static const _seed = Colors.teal;

  void _toggleTheme() {
    setState(() {
      _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoe Catalog',
      debugShowCheckedModeBanner: false,
      themeMode: _mode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: _seed),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seed,
          brightness: Brightness.dark,
        ),
      ),
      home: CatalogPage(items: sampleProducts, onToggleTheme: _toggleTheme),
    );
  }
}

class CatalogPage extends StatelessWidget {
  const CatalogPage({
    super.key,
    required this.items,
    required this.onToggleTheme,
  });

  final List<Product> items;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoe Catalog'),
        actions: [
          IconButton(
            tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          if (w < 600) {
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, i) => ProductTile(product: items[i]),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: w < 840 ? 2 : 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemCount: items.length,
            itemBuilder: (_, i) => ProductCard(product: items[i]),
          );
        },
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.url,
    required this.label,
    this.width,
    this.height,
  });

  final String url;
  final String label;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      semanticLabel: label,
      errorBuilder: (_, __, ___) => Container(
        width: width,
        height: height,
        color: scheme.surfaceContainerHighest,
        child: Icon(Icons.image_not_supported, color: scheme.onSurfaceVariant),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ProductImage(
          url: product.imagePath,
          label: product.name,
          width: 56,
          height: 56,
        ),
      ),
      title: Text(product.name),
      subtitle: Text('\₱${product.price.toStringAsFixed(2)}'),
      onTap: () => openProduct(context, product),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => openProduct(context, product),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ProductImage(url: product.imagePath, label: product.name),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: text.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\₱${product.price.toStringAsFixed(2)}',
                      style: text.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void openProduct(BuildContext context, Product product) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => ProductDetailPage(product: product)),
  );
}

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 10,
                  child: ProductImage(
                    url: product.imagePath,
                    label: product.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name, style: text.headlineSmall),
                      const SizedBox(height: 8),
                      Chip(label: Text(product.category)),
                      const SizedBox(height: 8),
                      Text(
                        '\₱${product.price.toStringAsFixed(2)}',
                        style: text.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(product.description, style: text.bodyLarge),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
