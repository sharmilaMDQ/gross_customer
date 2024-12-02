import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/CartScreenController.dart';
import 'AppTheme.dart';

class CartCommonComponent extends StatefulWidget {
  final String productImage;
  final String productDescription;
  final String productName;
  final String productQty;
  final String productPrice;
  final dynamic productPriceChangeable;
  final int? discountAvailable;
  final String? productDiscountPrice;
  final int counter;
  final int index;
  final VoidCallback OnPressed;
  final VoidCallback incrementCounter;
  final VoidCallback decrementCounter;

  CartCommonComponent({
    Key? key,
    required this.productImage,
    required this.productDescription,
    required this.productName,
    required this.productQty,
    required this.productPrice,
    required this.productPriceChangeable,
    this.discountAvailable,
    this.productDiscountPrice,
    required this.OnPressed,
    required this.index,
    required this.decrementCounter,
    required this.incrementCounter,
    this.counter = 1,
  }) : super(key: key);

  @override
  _ProductDisplayCommonComponentState createState() => _ProductDisplayCommonComponentState();
}

class _ProductDisplayCommonComponentState extends State<CartCommonComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CartScreenController controller = Get.put(CartScreenController());

    return Column(children: [
      SizedBox(
        height: 138,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.32,
              child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: <Widget>[
                        widget.productImage == null || widget.productImage.isEmpty
                            ? Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: MediaQuery.of(context).size.height * 0.06,
                                color: Colors.white,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.30,
                                  height: MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(10)
                                  ),
                                 
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                        height: 250,
                                        width: 300,
                                      child: CachedNetworkImage(
                                        imageUrl: '${widget.productImage}',
                                     
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.01,
                                          width: MediaQuery.of(context).size.width * 0.02,
                                          child: Image(
                                            height: 30,
                                            width: 30,
                                            image: AssetImage("assets/images/vkart_10.png"),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) => const Image(
                                          height: 30,
                                          width: 30,
                                          image: AssetImage("assets/images/vkart_10.png"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${widget.productName}',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${"Vegetables"}',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                          maxLines: 2, // Limit to 2 lines
                          overflow: TextOverflow.ellipsis, // Add ellipsis if the text exceeds 2 lines
                          softWrap: true,
                        ),
                      ),
                      // Text(
                      //   '₹ ${widget.productPriceChangeable.toStringAsFixed(2)}',
                      //   style: GoogleFonts.poppins(
                      //     color: Colors.black,
                      //     fontSize: 17,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                    ],
                  ),

                  // SizedBox(
                  //   width: 200,
                  //   child: Text(
                  //     '${"வெங்காயம்"}',
                  //     style: GoogleFonts.poppins(
                  //       color: Colors.black,
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w300,
                  //     ),
                  //     softWrap: true,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.width * 0.063,
                  // ),
                  // Row(
                  //   children: [
                  //     widget.discountAvailable == 0
                  //         ? Text(
                  //             ' ${widget.productPrice}',
                  //             style: GoogleFonts.poppins(
                  //               color: AppTheme.Buttoncolor,
                  //               fontSize: 18,
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           )
                  //         : Flexible(
                  //             child: Row(
                  //               children: [
                  //                 Text(
                  //                   '(${widget.productQty})',
                  //                   style: GoogleFonts.poppins(
                  //                     color: Colors.black,
                  //                     fontSize: 12,
                  //                     fontWeight: FontWeight.w400,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   '₹ ${widget.productPrice}',
                  //                   style: GoogleFonts.poppins(
                  //                     color: Colors.red,
                  //                     fontSize: 13,
                  //                     fontWeight: FontWeight.w600,
                  //                     decoration: TextDecoration.lineThrough,
                  //                   ),
                  //                 ),
                  //                 Expanded(
                  //                   flex: 2,
                  //                   child: Text(
                  //                     '₹${widget.productDiscountPrice}',
                  //                     style: GoogleFonts.poppins(
                  //                       color: AppTheme.Buttoncolor,
                  //                       fontSize: 20,
                  //                       fontWeight: FontWeight.w600,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //   ],
                  // ),
                     Text(
                                    '(${widget.productQty})',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                              Row(
                                children: [
                                  Text(
                                        '₹ ${widget.productPrice}',
                                        style: GoogleFonts.poppins(
                                          
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 7),
                                        child: Text(
                                        '₹${widget.productDiscountPrice}',
                                        style: GoogleFonts.poppins(
                                          color: AppTheme.Buttoncolor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                       ),
                                      ),
                                ],
                              ),    
                  
                ],
              ),
            ),
            Expanded(
              // Ensures third column takes equal space
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: widget.OnPressed,
                      icon: Icon(
                        Icons.delete,
                        size: 28,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: widget.decrementCounter,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: widget.counter == 1 ? AppTheme.IconBackground : Colors.red,
                            ),
                            child: Icon(
                              CupertinoIcons.minus,
                              color: widget.counter == 1 ? AppTheme.Buttoncolor : Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                        Text(
                          widget.counter.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: widget.counter > 1 ? Colors.black : Colors.red,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                        InkWell(
                          onTap: widget.incrementCounter,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppTheme.Buttoncolor,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 2,
        width: MediaQuery.of(context).size.width * 0.95,
        child: Obx(() {
          return controller.getLoading(widget.index)
              ? LinearProgressIndicator(
                  minHeight: 2,
                  borderRadius: BorderRadius.circular(10),
                  color: AppTheme.Buttoncolor,
                  backgroundColor: Colors.white,
                )
              : SizedBox.shrink();
        }),
      ),
    ]);
  }
}
