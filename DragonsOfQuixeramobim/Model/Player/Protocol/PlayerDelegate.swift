//
//  PlayerDelegate.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 8/24/22.
//

import Foundation

protocol PlayerDelegate: AnyObject {
    func setSkill(_ skill: Skill)
    func setHeight(_ height: Height)
    func setBody(_ body: Body)
    func takeAction(_ action: Action)
}
