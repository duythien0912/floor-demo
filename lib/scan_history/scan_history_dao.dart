import 'package:floor/floor.dart';

import 'scan_history.dart';

@dao
abstract class ScanHistoryDAO {
  @Query(
      'UPDATE ScanHistory set server_transfer = :status,layoutInput = :lyoutInput WHERE time = :time')
  Future<ScanHistory> updateSendtoServer(
      String status, String lyoutInput, double time);

  @Query("UPDATE ScanHistory set excel_transfer = :status WHERE time = :time")
  Future<void> updateSendtoExcel(String status, double time);

  @Query("DELETE FROM ScanHistory where time < :time")
  Future<void> deleteOldTime(double time);

  @Query("SELECT * FROM ScanHistory WHERE type = :type order by time desc")
  Future<List<ScanHistory>> findScanHistoryByType(String type);

  @insert
  Future<void> insertScanHistory(ScanHistory scanHistories);

  @update
  Future<void> updateScanHistory(ScanHistory scanHistories);

  @delete
  Future<void> deleteScanHistory(ScanHistory scanHistories);
}
