//
//  ViewController.swift
//  SearchBar2
//
//  Created by agile on 4/23/18.
//  Copyright © 2018 agile. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UISearchBarDelegate{

    @IBOutlet var objsearch: UISearchBar!
    @IBOutlet var tableviewobj: UITableView!
    
    var arrdata = ["First","Second","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
    var filteredData = [""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableviewobj.delegate = self
        tableviewobj.dataSource = self
        objsearch.delegate = self
        filteredData = arrdata
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = filteredData[indexPath.row]
        return cell!
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? arrdata : arrdata.filter { (item: String) -> Bool in
           
            return item.range(of: searchText, options: .anchored , range: nil, locale: nil) != nil
        }
        tableviewobj.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarCancelButtonClicked")
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarSearchButtonClicked")
    }

}
