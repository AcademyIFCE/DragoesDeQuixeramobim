//
//  StoryPageManager.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 8/24/22.
//

import Foundation

protocol StoryPageManagerProtocol {
    var playerDelegate: PlayerDelegate? { get set }
    var page: StoryPage { get set }
    init(page: StoryPage, delegate: PlayerDelegate)
    func markChoice(_ choice: Choice)
}

class StoryPageManager: StoryPageManagerProtocol {

    weak var playerDelegate: PlayerDelegate? = nil

    var page: StoryPage
    
    required init(page: StoryPage, delegate: PlayerDelegate) {
        self.page = page
        self.playerDelegate = delegate
    }
    
    func markChoice(_ choice: Choice) {
        guard let effect = page.effect, let choiceValue = choice.value else { return }
        switch effect {
        case "skill":
                playerDelegate?.setSkill(Skill(rawValue: choiceValue)!)
        case "height":
                playerDelegate?.setHeight(Height(rawValue: choiceValue)!)
        case "body":
                playerDelegate?.setBody(Body(rawValue: choiceValue)!)
        case "action":
                playerDelegate?.takeAction(Action(rawValue: choiceValue)!)
        default: break
        }
    }
}
