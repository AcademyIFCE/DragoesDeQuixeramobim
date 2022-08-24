//
//  ChoiceCell.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 8/23/22.
//

import Foundation
import UIKit

class ChoiceCell: UITableViewCell {
    
    var cardView : UIView!
    var label : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.setupCardView()
        self.setupAnswerLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCardView() {
        cardView = UIView()
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.white.cgColor
        cardView.layer.cornerRadius = 10
        
        self.addSubview(cardView)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        
    }
    
    func setupAnswerLabel() {
        label = UILabel()
        
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        
        cardView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            label.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10)
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            cardView.backgroundColor = .white
            label.textColor = .black
        } else {
            cardView.backgroundColor = .white.withAlphaComponent(0.15)
            label.textColor = .white
        }
    }
    
}

