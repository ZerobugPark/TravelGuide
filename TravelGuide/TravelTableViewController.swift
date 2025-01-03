//
//  TravelTableViewController.swift
//  TravelGuide
//
//  Created by youngkyun park on 1/3/25.
//

import UIKit

class TravelTableViewController: UITableViewController {

    
    let travelInfo = MagazineInfo()
    

    @IBOutlet var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 500
        tableView.allowsSelection = false
        headerLabel.font = .boldSystemFont(ofSize: 18)
        headerLabel.text = "YOUNG TRAVEL"
        headerLabel.textAlignment = .center
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewController", for: indexPath) as! TravelTableViewCell
        
        let row = travelInfo.magazine[indexPath.row]
        
        let image = row.photo_image
        
        if let image {
            let url = URL(string: image)
            cell.travelImageView?.kf.setImage(with: url)
        } else {
            cell.travelImageView?.image = UIImage(systemName: "star")
        }
        cell.travelImageView?.contentMode = .scaleAspectFill
        cell.travelImageView.layer.cornerRadius = 15
        cell.travelImageView.clipsToBounds = true
        
        cell.titleLabel.text = row.title
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.font = .boldSystemFont(ofSize: 20)
        
        cell.subtitleLabel.text = row.subtitle
        cell.subtitleLabel.font = .systemFont(ofSize: 14)
        cell.subtitleLabel.textColor = .gray
        cell.subtitleLabel.numberOfLines = 0
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyMMdd"
        if let stringToDate = formatter.date(from: row.date) {
            formatter.dateFormat = "yy년 MM월 dd일"
            let date = formatter.string(from: stringToDate)
            cell.dateLabel.text = "\(date)"
        } else {
            formatter.dateFormat = "yy년 MM월 dd일"
            let date = formatter.string(from: Date())
            cell.dateLabel.text = "\(date)"
        }
        
        cell.dateLabel.font = .systemFont(ofSize: 12)
        cell.dateLabel.textColor = .gray
        
       
        
        
        
        return cell
    }
    
    



}
