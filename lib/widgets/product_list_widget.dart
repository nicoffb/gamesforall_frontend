import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesforall_frontend/widgets/product_card_widget.dart';

import '../blocs/productList/product_bloc.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final scrollController = ScrollController();

  //* Metodos de estado
  @override
  void initState() {
    super.initState();

    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      switch (state.status) {
        //! Estado de fallo
        case ProductStatus.failure:
          return const Center(
            child: const Text('Failed to get products'),
          );

        //! Estado de exito
        case ProductStatus.success:
          if (state.products.isEmpty) {
            return const Center(
              child: Text('There is no products'),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.products.length
                  ? Column(children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Container(
                        width: 3,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                      ),
                    ])
                  : ProductCard(product: state.products[index]);
            },
            itemCount: state.hasReachedMax
                ? state.products.length
                : state.products.length + 1,
            controller: scrollController,
          );

        //! Estado inicial
        case ProductStatus.initial:
          return const Center(
            child: CircularProgressIndicator(),
          );
      }
    });
  }

  //* Otros metodos
  void _onScroll() {
    if (_isBottom) context.read<ProductBloc>().add(GetProductsEvent());
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.8);
  }
}
