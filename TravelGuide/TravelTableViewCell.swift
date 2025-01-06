//
//  TravelTableViewCell.swift
//  TravelGuide
//
//  Created by youngkyun park on 1/3/25.
//

import UIKit
import Kingfisher


class TravelTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let identifier = "TravelTableViewCell"
    
    private let formatter = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        travelImageView?.contentMode = .scaleAspectFill
        travelImageView.layer.cornerRadius = 15
        travelImageView.clipsToBounds = true
        
        
        titleLabel.numberOfLines = 0
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.textColor = .gray
        subtitleLabel.numberOfLines = 0
        
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .gray
    }
    
    func configureData(row: Magazine) {
        
        let image = row.photo_image
        if let image {
            let url = URL(string: image)
            travelImageView?.kf.setImage(with: url)
        } else {
            travelImageView?.image = UIImage(systemName: "star")
        }
        
        titleLabel.text = row.title
        subtitleLabel.text = row.subtitle
        let inputFormat = "yyMMdd"
        let outputFormat = "yy년 MM월 dd일"
        let formattedDate  = formatDate(from: row.date, inputFormat: inputFormat, outputFormat: outputFormat)
        
        dateLabel.text = formattedDate
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
