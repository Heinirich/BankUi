class OperationModel {
  var name;
  var selectedIcon;
  var unselectedIcon;

  OperationModel(this.name, this.selectedIcon, this.unselectedIcon);
}

List<OperationModel> datas = operationsData.map((item) =>
    OperationModel(item['name'], item['selectedIcon'], item['unselectedIcon'])).toList();

var operationsData = [
  {
    "name": "Money\nTransfer",
    "selectedIcon": "assets/svg/money_transfer_white.svg",
    "unselectedIcon": "assets/svg/money_transfer_blue.svg"
  },
  {
    "name": "Bank\nWithdraw",
    "selectedIcon": "assets/svg/bank_withdraw_white.svg",
    "unselectedIcon": "assets/svg/bank_withdraw_blue.svg"
  },
  {
    "name": "Insight\nTracking",
    "selectedIcon": "assets/svg/insight_tracking_white.svg",
    "unselectedIcon": "assets/svg/insight_tracking_blue.svg"
  },
];
