//
//  StoryViewModel.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 8/24/22.
//

import Foundation

class StoryViewModel {

    weak var delegate: StoryViewModelDelegate?

    private var player = Player()
    private var story = Story()
    
    private lazy var manager: StoryPageManagerProtocol = StoryPageManager(page: story.currentPage, delegate: self)
    
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
        if manager.page.choices.first?.text != "FIM" {
            manager.page = story.nextPage(skip: player.amountOfPagesToSkip())
        } else {
            restart()
        }
        delegate?.load(text: manager.page.text, choices: manager.page.choices)
    }
    
    func restart() {
        player = Player()
        story = Story()
        manager = StoryPageManager(page: story.currentPage, delegate: self)
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
