//
//  Player.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 8/24/22.
//

import Foundation

// Missão 1
class Player {
    var mainSkill: Skill?
    var height: Height?
    var body: Body?
    var actions: [Action] = []
    
    func amountOfPagesToSkip() -> Int {
        var pages = 0
        switch actions.count {
        case 0:
            return pages
        case 1:
            if actions.contains(.makePeace) {
                pages += 1
                if mainSkill == .Charism {
                    pages += 1
                }
            }
            return pages
        case 2:
            if actions.contains(.rainByMagic) {
                if mainSkill == .Magic {
                    pages += 1
                }
            } else if actions.contains(.inventFireExtinguisher) {
                if mainSkill == .Inventor {
                    pages += 1
                }
            } else if actions.contains(.runaway) {
                if (body == .Strong && height == .Short) || mainSkill == .Force {
                    pages += 2
                }
            }
            return pages == 0 ? 3 : pages
        default:
            return pages
        }
    }
    
}
