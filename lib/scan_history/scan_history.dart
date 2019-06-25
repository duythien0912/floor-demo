import 'package:floor/floor.dart';

@Entity(tableName: "ScanHistory")
class ScanHistory {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: "id")
  double id = 0;

  @ColumnInfo(name: "time")
  double time = 0;

  @ColumnInfo(name: "scanned_code")
  String scanned_code;

  @ColumnInfo(name: "type")
  String type;
  @ColumnInfo(name: "layoutInput")
  String layoutInput;

  @ColumnInfo(name: "excel_transfer")
  String excel_transfer;

  @ColumnInfo(name: "server_transfer")
  String server_transfer;

  ScanHistory(double time, String scanned_code, String type,
      String excel_transfer, String server_transfer, String layoutInput) {
    this.time = time;
    this.scanned_code = scanned_code;
    this.type = type;
    this.layoutInput = layoutInput;
    this.excel_transfer = excel_transfer;
    this.server_transfer = server_transfer;
  }

  String getLayoutInput() {
    return layoutInput;
  }

  void setLayoutInput(String layoutInput) {
    this.layoutInput = layoutInput;
  }

  void setExcel_transfer(String excel_transfer) {
    this.excel_transfer = excel_transfer;
  }

  void setServer_transfer(String server_transfer) {
    this.server_transfer = server_transfer;
  }

  void setTime(double time) {
    this.time = time;
  }

  void setScanned_code(String scanned_code) {
    this.scanned_code = scanned_code;
  }

  void setType(String type) {
    type = type;
  }

  double getTime() {
    return time;
  }

  String getScanned_code() {
    return scanned_code;
  }

  String getType() {
    return type;
  }

  String getExcel_transfer() {
    return excel_transfer;
  }

  String getServer_transfer() {
    return server_transfer;
  }
}
