import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:computer_shop_app/src/domain/entities/type/type_drop_downs.dart';
import 'package:computer_shop_app/src/presentation/pages/product/bloc/product_cubit.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class ProductDropDowns extends StatefulWidget {
  const ProductDropDowns({super.key});

  @override
  ProductDropDownsState createState() => ProductDropDownsState();
}

class ProductDropDownsState extends State<ProductDropDowns> {
  String selectedTypeName = '';

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().productTypeItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: PopupMenuButton<TypeDropDowns>(
                color: AppTheme.red,
                offset: const Offset(100, 8),
                onSelected: (value) {
                  setState(() {
                    selectedTypeName = value.name;
                  });
                  context.read<ProductCubit>().typeChanged(value!.value);
                },
                initialValue: state.productTypeItems.isNotEmpty ? null : null,
                itemBuilder: (context) {
                  return state.productTypeItems.map((item) {
                    return PopupMenuItem<TypeDropDowns>(
                      value: item,
                      child: Row(
                        children: [
                          const SizedBox(width: 14),
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
                child: ListTile(
                  title: Text(
                    selectedTypeName == ''
                        ? state.productTypeItems.isNotEmpty
                            ? state.productTypeItems.first.name
                            : ''
                        : selectedTypeName,
                    style: const TextStyle(
                      color: AppTheme.black,
                    ),
                  ),
                  trailing:
                      const Icon(Icons.arrow_drop_down, color: AppTheme.black),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
