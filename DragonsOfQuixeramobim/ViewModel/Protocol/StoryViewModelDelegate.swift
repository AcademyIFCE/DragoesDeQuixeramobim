//
//  StoryViewModelDelegate.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 8/24/22.
//

import Foundation

protocol StoryViewModelDelegate: AnyObject {
    func load(text: String, choices: [Choice])
}
