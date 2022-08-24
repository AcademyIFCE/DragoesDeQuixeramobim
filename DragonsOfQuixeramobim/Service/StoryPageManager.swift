//
//  StoryPageManager.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 8/24/22.
//

import Foundation

class StoryPageManager {

    weak var characterDelegate: PlayerDelegate? = nil

    var page: StoryPage
    
    init(page: StoryPage, delegate: PlayerDelegate) {
        self.page = page
        self.characterDelegate = delegate
    }
    
    func markChoice(_ choice: Choice) {
        guard let effect = page.effect, let choiceValue = choice.value else { return }
        switch effect {
        case "skill":
            characterDelegate?.setSkill(Skill(rawValue: choiceValue)!)
        case "height":
            characterDelegate?.setHeight(Height(rawValue: choiceValue)!)
        case "body":
            characterDelegate?.setBody(Body(rawValue: choiceValue)!)
        case "action":
            characterDelegate?.takeAction(Action(rawValue: choiceValue)!)
        default: break
        }
    }
}
