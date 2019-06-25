package com.pikatech.database;

import android.arch.persistence.room.ColumnInfo;
import android.arch.persistence.room.Entity;
import android.arch.persistence.room.PrimaryKey;


@Entity(tableName = "ScanHistory")
public class ScanHistory {


    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "id")
    public long id=0;

    @ColumnInfo(name = "time")
    public long time=0;

    @ColumnInfo(name = "scanned_code")
    public String scanned_code;

    @ColumnInfo(name = "type")
    public String type;
    @ColumnInfo(name = "layoutInput")
    public String layoutInput;


    @ColumnInfo(name = "excel_transfer")
    public String excel_transfer;

    @ColumnInfo(name = "server_transfer")
    public String server_transfer;

    public ScanHistory(long time, String scanned_code,String type,String excel_transfer,String server_transfer,
                            String layoutInput) {
        this.time=time;
        this.scanned_code=scanned_code;
        this.type=type;
        this.layoutInput=layoutInput;
        this.excel_transfer=excel_transfer;
        this.server_transfer=server_transfer;
    }

    public String getLayoutInput() {
        return layoutInput;
    }

    public void setLayoutInput(String layoutInput) {
        this.layoutInput = layoutInput;
    }

    public void setExcel_transfer(String excel_transfer) {
        this.excel_transfer = excel_transfer;
    }

    public void setServer_transfer(String server_transfer) {
        this.server_transfer = server_transfer;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public void setScanned_code(String scanned_code) {
        this.scanned_code = scanned_code;
    }

    public void setType(String type) {
        type = type;
    }

    public long getTime() {
        return time;
    }

    public String getScanned_code() {
        return scanned_code;
    }

    public String getType() {
        return type;
    }

    public String getExcel_transfer() {
        return excel_transfer;
    }

    public String getServer_transfer() {
        return server_transfer;
    }
}
