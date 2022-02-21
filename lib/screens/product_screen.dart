import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_app_flutter/models/models.dart';
import 'package:products_app_flutter/providers/providers.dart';
import 'package:products_app_flutter/services/services.dart';
import 'package:products_app_flutter/theme/theme.dart';
import 'package:products_app_flutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  static const routeName = 'Product';

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);
    final product = productService.selectedProduct;
    return ChangeNotifierProvider(
      create: (context) => ProductFormProvider(product: product),
      child: _ProductScreenBody(product: product),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                SafeArea(
                  child: ProductImage(
                    imageUrl: product.picture,
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      // TODO: Camera or gallery
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const _ProductForm(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Save product
        },
        child: const Icon(Icons.save_outlined),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    final boxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(AppTheme.valueRadius),
        bottomLeft: Radius.circular(AppTheme.valueRadius),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(0, 5),
        )
      ],
    );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: boxDecoration,
      child: Form(
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              initialValue: product.name,
              onChanged: (value) => product.name = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Product name',
                labelText: 'Name:',
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              initialValue: product.price.toString(),
              onChanged: (value) {
                product.price = double.tryParse(value) == null
                    ? product.price
                    : double.parse(value);
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
              ],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '\$999',
                labelText: 'Price:',
              ),
            ),
            const SizedBox(height: 30),
            SwitchListTile.adaptive(
              value: product.available,
              onChanged: productForm.updateAvailability,
              title: const Text('Available'),
              activeColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
