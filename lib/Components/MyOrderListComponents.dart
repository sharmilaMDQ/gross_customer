import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrderListCommonComponent extends StatefulWidget {
  final String productImage;
  // final String productDescription;
  final String productName;
  final String productQty;
  final String productPrice;
  final String picUpTime;

  // final VoidCallback OnPressed;
  MyOrderListCommonComponent({
    Key? key,
    required this.productImage,
    //required this.productDescription,
    required this.productName,
    required this.productQty,
    required this.productPrice,
    required this.picUpTime,
    // this.OnPressed,
  }) : super(key: key);

  @override
  _ProductDisplayCommonComponentState createState() => _ProductDisplayCommonComponentState();
}

class _ProductDisplayCommonComponentState extends State<MyOrderListCommonComponent> {
  @override
  void initState() {
    super.initState();
  }

  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter == 1) {
        return;
      }
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
      Row(
        children: [
          Container(
              child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      '${widget.productImage}',
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.1,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image); // Placeholder icon for error
                      },
                    )),
              )
            ],
          )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    //height: MediaQuery.of(context).size.height * 0.01,
                    child: Text('${widget.productName}',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  // InkWell(
                  //   onTap: widget.OnPressed,
                  //   child: Icon(
                  //     Icons.delete,
                  //     size: 20, color: Colors.orange,
                  //   ),
                  // ),
                  // IconButton(
                  //   padding: EdgeInsets.zero,
                  //   constraints: BoxConstraints(),
                  //   onPressed: widget.OnPressed, icon:  Icon(
                  //   Icons.delete,
                  //   size: 20,
                  //   color: Colors.orange,
                  // ),)
                ],
              ),
              // Text(
              //     '${widget.productDescription}',
              //     style: GoogleFonts.poppins(
              //       color: Colors.black,
              //       fontSize: 12,
              //       fontWeight: FontWeight.w300,
              //     )
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Row(
                children: [
                  Text('Product Quantity : ',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      )),
                  Text(' ${widget.productQty}',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.25,
                    child: Row(
                      children: [
                        Text('Product Price : ',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                        Text('₹ ${widget.productPrice}',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     InkWell(
                  //       onTap: decrementCounter,
                  //       child: Container(
                  //         padding: EdgeInsets.all(5),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(100),
                  //             color: AppTheme.IconBackground),
                  //         child: Icon(
                  //           CupertinoIcons.minus,
                  //           color: AppTheme.Buttoncolor,
                  //           size: 15,
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width * 0.02,
                  //     ),
                  //     Text(
                  //       '$counter',
                  //       style: TextStyle(
                  //         fontSize: 12,
                  //         fontWeight: FontWeight.w400,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width * 0.02,
                  //     ),
                  //     InkWell(
                  //       onTap: incrementCounter,
                  //       child: Container(
                  //         padding: EdgeInsets.all(5),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(100),
                  //             color: AppTheme.Buttoncolor),
                  //         child: Icon(
                  //           Icons.add,
                  //           color: Colors.white,
                  //           size: 15,
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width * 0.03,
                  //     ),
                  //   ],
                  // )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              widget.picUpTime != ""
                  ? Row(
                      children: [
                        Text('Pick up Time :',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                        Text('${widget.picUpTime}',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    )
                  : Row(
                      children: [
                        Text('',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                        Text('',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
            ],
          ),
        ],
      ),
    ]);
  }
}
