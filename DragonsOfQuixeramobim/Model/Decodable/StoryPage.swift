//
//  StoryPage.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 8/24/22.
//

import Foundation

class StoryPage: Decodable {
    let text: String
    let choices: [Choice]
    let effect: String?
}
