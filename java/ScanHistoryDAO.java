package com.pikatech.database;

import android.arch.persistence.room.Dao;
import android.arch.persistence.room.Delete;
import android.arch.persistence.room.Insert;
import android.arch.persistence.room.Query;
import android.arch.persistence.room.Update;

import java.util.List;

@Dao
public interface ScanHistoryDAO {

    @Insert
    void insert(ScanHistory... scanHistories);

    @Update
    void update(ScanHistory... scanHistories);

    @Delete
    void delete(ScanHistory... scanHistories);


    @Query("update ScanHistory set server_transfer=:Status,layoutInput=:LyoutInput where time=:time ")
    void updateSendtoServer(long time,String Status,String LyoutInput);

    @Query("update ScanHistory set excel_transfer=:Status where time=:time ")
    void updateSendtoExcel(long time,String Status);

    @Query("delete FROM ScanHistory where time<:time ")
    void deleteOldTime(long time);

    @Query("SELECT * FROM ScanHistory where type= :Type order by time desc ")
    List<ScanHistory> getScanHistoryByType(String Type);
}
