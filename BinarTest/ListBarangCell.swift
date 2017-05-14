//
//  ListBarangCell.swift
//  BinarTest
//
//  Created by Fathureza Januarza on 5/14/17.
//  Copyright © 2017 tedihouse. All rights reserved.
//

import UIKit

class ListBarangCell: UITableViewCell {

    @IBOutlet weak var namaBarangLbl: UILabel!
    @IBOutlet weak var jumlahBarangLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configurePost(post: BarangData){
        namaBarangLbl.text = post.namaBarang
        jumlahBarangLbl.text = "\(post.jumlahBarang)"
    }
}
