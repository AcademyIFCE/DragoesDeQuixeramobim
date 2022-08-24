//
//  StoryView.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 8/23/22.
//

import Foundation
import UIKit

class StoryView: UIView {
    
    weak var delegate: StoryViewDelegate?
    
    var label : UILabel!
    var button : UIButton!
    var tableView: UITableView!
    
    var choices: [Choice] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        setupTableView()
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "background")!
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func setupLabel() {
        
        label = UILabel()
        label.numberOfLines = 0
        
        let font = UIFont.boldSystemFont(ofSize: 18)
        label.font = font
        
        label.textColor = .white
        label.textAlignment = .center
        
        self.label.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(label)
        
        self.label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        self.label.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -10).isActive = true
    }
    
    func setupTableView() {
        
        tableView = UITableView()
        
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.register(ChoiceCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 190),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

extension StoryView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ChoiceCell
        cell.label.text = choices[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return choices.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.select(choices[indexPath.row])
    }
    
}

