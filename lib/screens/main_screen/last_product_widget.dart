import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/rcp_data_provider.dart';
import 'package:rcp/screens/product_overview/product_overview.dart';
import 'package:rcp/utils/image_network.dart';

import '../../product_modal/product_modal.dart';

class LastProductList extends StatefulWidget {
  const LastProductList({super.key});

  @override
  State<LastProductList> createState() => _LastProductListState();
}

class _LastProductListState extends State<LastProductList> {
  List<Product> lastProduct = [];
  @override
  void initState() {
    lastProduct =
        Provider.of<RcpData>(context, listen: false).getLastProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: GridView.builder(
        itemCount: lastProduct.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3 / 4,
            mainAxisSpacing: 5,
            maxCrossAxisExtent: double.infinity),
        itemBuilder: (context, index) => InkWell(
          child: GridTile(
            child: SizedBox(
              width: 100,
              height: 130,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ProductOverviewScreen(
                              id: lastProduct[index].id as int);
                        },
                      ));
                    },
                    child: ImgageLoading(
                        imageSrc:
                            lastProduct[index].images.first.src.toString(),
                        boxFit: BoxFit.fill),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
