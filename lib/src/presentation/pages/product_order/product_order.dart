import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:computer_shop_app/src/presentation/pages/product_order/bloc/product_order_cubit.dart';
import 'package:computer_shop_app/src/presentation/pages/product_order/widget/product_order_list.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:computer_shop_app/src/presentation/widgets/toggle/cumtom_toggle.dart';
import 'package:computer_shop_app/src/presentation/pages/product_order_history/product_order_history.dart';

class ProductOrderPage extends StatefulWidget {
  const ProductOrderPage({Key? key}) : super(key: key);

  @override
  State<ProductOrderPage> createState() => _ProductOrderPageState();
}

class _ProductOrderPageState extends State<ProductOrderPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Column(
        children: <Widget>[
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomToggleTab(
                label: 'รายการสินค้า',
                isSelected: _tabController.index == 0,
                onTap: () {
                  _tabController.animateTo(0);
                },
              ),
              CustomToggleTab(
                label: 'ประวัติคำสั่งซื้อ',
                isSelected: _tabController.index == 1,
                onTap: () {
                  _tabController.animateTo(1);
                },
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _productOrderList(),
                const ProductOrderHistoryPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _productOrderList() {
    return BlocBuilder<ProductOrderCubit, ProductOrderState>(
      builder: (BuildContext context, ProductOrderState state) {
        return const ProductOrderList();
      },
    );
  }
}
