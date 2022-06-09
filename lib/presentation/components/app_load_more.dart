// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_color.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_loading.dart';
import 'package:get/get.dart';

import '../../data/const/app_text.dart';
import '../../domain/interface/paginate.controller.interface.dart';

class AppLoadMore<Type extends PaginationControllerInterface>
    extends StatefulWidget {
  const AppLoadMore(
      {Key? key,
      required this.onTap,
      required this.itemWidget,
      this.physics,
      this.shrinkWrap,
      required this.controller,
      this.isNeedInit = true,
      this.loadMoreTextWidget})
      : super(key: key);
  final Function onTap;
  final Function itemWidget;
  final ScrollPhysics? physics;
  final bool? shrinkWrap;
  final Type controller;
  final bool isNeedInit;
  final Widget? loadMoreTextWidget;
  @override
  _AppLoadMoreState<Type> createState() => _AppLoadMoreState<Type>();
}

class _AppLoadMoreState<Type extends PaginationControllerInterface>
    extends State<AppLoadMore> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isNeedInit) {
      widget.controller.fetchInitialItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Type>(
      builder: (controller) => controller.isLoading
          ? Center(
              child: AppLoading(),
            )
          : controller.items.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/empty_data.png",
                        width: 250,
                        height: 250,
                      ),
                      // Text(
                      //   "Data Masih Kosong",
                      //   style: AppText.H4(color: Colors.white),
                      // )
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap:
                      widget.shrinkWrap != null ? widget.shrinkWrap! : false,
                  physics: widget.physics,
                  itemCount: controller.items.length < controller.total
                      ? controller.items.length + 1
                      : controller.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return controller.items.length < controller.total &&
                            index == controller.items.length
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: InkWell(
                                  onTap: () {
                                    controller.fetchNextItems();
                                  },
                                  child: widget.loadMoreTextWidget ??
                                      Text('Tampilkan Lebih Banyak',
                                          style: AppText.titleBig(
                                              color: AppColor.primaryColor)),
                                ),
                              )
                            ],
                          )
                        : widget.itemWidget(controller.items[index]);
                  },
                ),
    );
  }
}
