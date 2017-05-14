//
//  BarangData.swift
//  BinarTest
//
//  Created by Fathureza Januarza on 5/14/17.
//  Copyright © 2017 tedihouse. All rights reserved.
//

import Foundation
import RealmSwift

class BarangData: Object{
    dynamic var idBarang: Int = 0
    dynamic var namaBarang: String = ""
    dynamic var jumlahBarang: Int = 0
    
    override static func primaryKey() -> String{
        return "idBarang"
    }
}
