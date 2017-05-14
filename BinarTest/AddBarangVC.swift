//
//  AddBarangVC.swift
//  BinarTest
//
//  Created by Fathureza Januarza on 5/14/17.
//  Copyright © 2017 tedihouse. All rights reserved.
//

import UIKit
import RealmSwift
class AddBarangVC: UIViewController {

    @IBOutlet weak var namaBarangField: UITextField!
    @IBOutlet weak var jumlahBarangField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addBarangBtn(_ sender: UIButton){
        if namaBarangField.text != nil && jumlahBarangField.text != nil{
            let number = arc4random() % 10
            let namaBarang: String = namaBarangField.text!
            let jumlahBarang: Int = Int(jumlahBarangField.text!)!
            do{
                let realm = try Realm()
                try realm.write {
                    realm.create(BarangData.self, value: ["idBarang": number, "namaBarang": namaBarang, "jumlahBarang": jumlahBarang], update: true)
                }
                let alert = UIAlertController(title: "Success", message: "Success", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)

            }catch let error as NSError{
                print(error)
            }
        }else{
            let alert = UIAlertController(title: "Error", message: "Nama barang or Jumlah Barang can't be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
    }
    

}
