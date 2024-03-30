import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:computer_shop_app/src/presentation/widgets/text/mesage.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:computer_shop_app/src/presentation/pages/product_order/widget/product_order_toggle.dart';

class ProductOrderPage extends StatefulWidget {
  const ProductOrderPage({super.key});

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
              ProductOrderToggleTab(
                label: 'รายการสินค้า',
                isSelected: _tabController.index == 0,
                onTap: () {
                  _tabController.animateTo(0);
                },
              ),
              ProductOrderToggleTab(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (_tabController.index == 0)
                      const Message(
                          message: 'ไม่มีรายการสินค้า',
                          icon: Icons.error_outline,
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (_tabController.index == 1)
                      const Message(
                          message: 'ไม่มีประวัติคำสั่งซื้อ',
                          icon: Icons.remove_shopping_cart_outlined,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
