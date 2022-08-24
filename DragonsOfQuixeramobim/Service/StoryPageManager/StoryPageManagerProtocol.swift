//
//  StoryPageManagerProtocol.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 24/08/22.
//

import Foundation

protocol StoryPageManagerProtocol {
    var playerDelegate: PlayerDelegate? { get set }
    var page: StoryPage { get set }
    init(page: StoryPage, delegate: PlayerDelegate)
    func markChoice(_ choice: Choice)
}
