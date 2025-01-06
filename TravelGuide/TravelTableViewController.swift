//
//  TravelTableViewController.swift
//  TravelGuide
//
//  Created by youngkyun park on 1/3/25.
//

import UIKit


class TravelTableViewController: UITableViewController {

    
    let travelInfo = MagazineInfo().magazine
    

    @IBOutlet var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.rowHeight = 500
        tableView.separatorStyle = .none //테이블뷰 라인 없애기
       
        let headerText = "YOUNG TRAVEL"
        headerLabel.font = .boldSystemFont(ofSize: 18)
        headerLabel.text = headerText
        headerLabel.textAlignment = .center
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as! TravelTableViewCell
        
        let row = travelInfo[indexPath.row]
        
        cell.configureData(row: row)

        
        return cell
    }
    



}
