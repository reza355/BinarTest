//
//  ListBarangVC.swift
//  BinarTest
//
//  Created by Fathureza Januarza on 5/14/17.
//  Copyright © 2017 tedihouse. All rights reserved.
//

import UIKit
import RealmSwift

class ListBarangVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let barang = List<BarangData>()
    let loadBarang = try! Realm().objects(BarangData.self).sorted(byKeyPath: "namaBarang", ascending: true)
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadBarang.count
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            let val = loadBarang[indexPath.row].namaBarang
            do{
                let realm = try Realm()
                let repeatedItem = realm.objects(BarangData.self).filter("namaBarang = '\(val)'")
                try realm.write {
                    realm.delete(repeatedItem)
                }
            }catch let error as NSError{
                print(error)
            }
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListBarangCell", for: indexPath) as? ListBarangCell{
            cell.configurePost(post: loadBarang[indexPath.row])
            return cell
        }else{
            return ListBarangCell()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
