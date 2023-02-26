package com.salt.dto;

import lombok.Data;

import java.util.Date;

@Data
public class Consumer {
    private String nama;
    private String alamat;
    private String kota;
    private String provinsi;
    private String tglRegistrasi;
    private String status;
}
