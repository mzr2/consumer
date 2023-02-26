package com.salt.Entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "konsumen")
@Data
public class ConsumerEntity {
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private Integer id;
    private String nama;
    private String alamat;
    private String kota;
    private String provinsi;
    private Date tglRegistrasi;
    private String status;
}
