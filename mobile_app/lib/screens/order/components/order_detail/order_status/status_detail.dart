class StatusDetail {
  final String title;
  final bool isChecked;

  StatusDetail({
    required this.isChecked,
    required this.title,
  });

  static List<StatusDetail> getStatus(String status) {
    final statusList = [
      StatusDetail(
        isChecked: ['pending', 'shipped', 'delivered'].contains(status),
        title: 'Order Confirmed',
      ),
      StatusDetail(
        isChecked: ['shipped', 'delivered'].contains(status),
        title: 'Order Shipped',
      ),
      StatusDetail(
        isChecked: status == 'delivered',
        title: 'Order Placed',
      ),
    ];

    return statusList;
  }
}
