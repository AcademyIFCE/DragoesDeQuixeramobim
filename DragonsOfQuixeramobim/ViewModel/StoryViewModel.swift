//
//  StoryViewModel.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 8/24/22.
//

import Foundation

class StoryViewModel {

    weak var delegate: StoryViewModelDelegate?

    private let player = Player()
    private let story = Story()
    
    private lazy var manager = StoryPageManager(page: story.currentPage, delegate: self)
    
    var textForCurrentPage: String {
        story.currentPage.text
    }
    var choicesForCurrentPage: [Choice] {
        story.currentPage.choices
    }
    
    func select(choice: Choice) {
        manager.markChoice(choice)
    }
    
    func nextPage() {
        guard manager.page.choices.first?.text != "FIM." else { return }
        manager.page = story.nextPage(skip: player.amountOfPagesToSkip())
        delegate?.load(text: manager.page.text, choices: manager.page.choices)
    }
    
}

extension StoryViewModel: PlayerDelegate {
    func setSkill(_ skill: Skill) {
        player.mainSkill = skill
    }
    
    func setHeight(_ height: Height) {
        player.height = height
    }
    
    func setBody(_ body: Body) {
        player.body = body
    }
    
    func takeAction(_ action: Action) {
        player.actions.append(action)
    }
}
