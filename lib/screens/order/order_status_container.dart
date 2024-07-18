import 'package:flutter/material.dart';

class OrderStatusContainer extends StatefulWidget {
  const OrderStatusContainer({super.key, required this.status});
  final String status;

  @override
  State<OrderStatusContainer> createState() => _OrderStatusContainerState();
}

class _OrderStatusContainerState extends State<OrderStatusContainer> {
  late Color boxColor;
  late Color textColor;

  @override
  void initState() {
    super.initState();
    boxColor = widget.status == 'pending'
        ? const Color(0xff06AED4)
        : widget.status == 'completed'
            ? const Color(0xff10B981)
            : widget.status == 'cancelled'
                ? const Color(0xffF79009)
                : widget.status == 'shipped'
                    ? const Color(0xff10B981)
                    : widget.status == 'returned'
                        ? const Color(0xffF04438)
                        : const Color(0xff10B981);
    textColor = widget.status == 'pending'
        ? const Color(0xff0E7090)
        : widget.status == 'completed'
            ? const Color(0xff0B815A)
            : widget.status == 'cancelled'
                ? const Color(0xffB54708)
                : widget.status == 'shipped'
                    ? const Color(0xff0B815A)
                    : widget.status == 'returned'
                        ? const Color(0xffB42318)
                        : const Color(0xff0B815A);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: boxColor,
        ),
        child: Center(
            child: Text(
          widget.status.toUpperCase(),
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )),
      ),
    );
  }
}
