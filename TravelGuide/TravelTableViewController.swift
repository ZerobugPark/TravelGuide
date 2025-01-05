//
//  TravelTableViewController.swift
//  TravelGuide
//
//  Created by youngkyun park on 1/3/25.
//

import UIKit


class TravelTableViewController: UITableViewController {

    
    let travelInfo = MagazineInfo().magazine
    let formatter = DateFormatter()

    @IBOutlet var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 500
        tableView.separatorStyle = .none //테이블뷰 라인 없애기
       
        headerLabel.font = .boldSystemFont(ofSize: 18)
        headerLabel.text = "YOUNG TRAVEL"
        headerLabel.textAlignment = .center
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewController", for: indexPath) as! TravelTableViewCell
        
        let row = travelInfo[indexPath.row]
        
        setImage(magazine: row, cell: cell)
        setTitle(magazine: row, cell: cell)
        setDate(magazine: row, cell: cell)

        
        return cell
    }
    
    private func setImage(magazine row: Magazine, cell:TravelTableViewCell) {
        
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
    }
    
    private func setTitle(magazine row: Magazine, cell:TravelTableViewCell) {
       
        cell.titleLabel.text = row.title
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.font = .boldSystemFont(ofSize: 20)
        
        cell.subtitleLabel.text = row.subtitle
        cell.subtitleLabel.font = .systemFont(ofSize: 14)
        cell.subtitleLabel.textColor = .gray
        cell.subtitleLabel.numberOfLines = 0
    }

    private func setDate(magazine row: Magazine, cell:TravelTableViewCell) {
      
        let formattedDate  = formatDate(from: row.date, inputFormat: "yyMMdd", outputFormat: "yy년 MM월 dd일")
        
        cell.dateLabel.text = formattedDate
        cell.dateLabel.font = .systemFont(ofSize: 12)
        cell.dateLabel.textColor = .gray
        
    }

    private func formatDate(from input: String, inputFormat: String, outputFormat: String) -> String {
        
        formatter.dateFormat = inputFormat
        if let date = formatter.date(from: input) {
            formatter.dateFormat = outputFormat
            return formatter.string(from: date)
        } else {
            formatter.dateFormat = outputFormat
            return formatter.string(from: Date())
        }
        
    }


}
