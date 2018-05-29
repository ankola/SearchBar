//
//  ViewController.swift
//  searchdemo
//
//  Created by agile on 4/20/18.
//  Copyright © 2018 agile. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchResultsUpdating {

    @IBOutlet var objView: UIView!
    @IBOutlet var objSearchbar: UISearchBar! 
    @IBOutlet var objtableview: UITableView!
    
    var arrdata = ["First","Second","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
    var filteredData : [String]!
    
    var labelname = ["No Data Found","No Data Found"]
    
    var searchcontroller = UISearchController(searchResultsController: nil)
    
        override func viewDidLoad() {
        super.viewDidLoad()
        objtableview.delegate = self
        objtableview.dataSource = self
        searchcontroller.searchResultsUpdater = self
        searchcontroller.dimsBackgroundDuringPresentation = false
        filteredData = arrdata
        self.objtableview.tableHeaderView = searchcontroller.searchBar
        }
 
    // TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchcontroller.isActive && searchcontroller.searchBar != nil {

            if filteredData != nil{
                return self.filteredData.count
            }else{
                return self.labelname.count
            }
        } else{
            return arrdata.count
    }
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if(cell == nil)
        {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        }
        
        if searchcontroller.isActive && searchcontroller.searchBar != nil {
            
            if filteredData != nil{
                cell?.textLabel?.text = filteredData[indexPath.row]

            }else{
                cell?.textLabel?.text = labelname[indexPath.row]

                print(labelname)
            }
        }else{
            cell?.textLabel?.text = arrdata[indexPath.row]
        }
            return cell!
        }
    
    
    func filterContentForSearc(searchString:String) {
        self.filteredData = self.arrdata.filter()
            { nil != $0.range(of: searchString)}
        self.objtableview.reloadData()
        }
    
    func updateSearchResults(for searchController: UISearchController) {
        
         self.filterContentForSearc(searchString: searchController.searchBar.text!)
    }
}

