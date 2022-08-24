//
//  Story.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 8/23/22.
//

import Foundation

class Story {

    private let url = Bundle.main.url(forResource: "story", withExtension: "json")!
    private let pages: [StoryPage]
    private var currentPageIndex: Int = 0
    
    var currentPage: StoryPage {
        pages[currentPageIndex]
    }
    
    init() {
        do {
            let data = try Data(contentsOf: url)
            self.pages = try JSONDecoder().decode([StoryPage].self, from: data)
        } catch {
            print(error)
            self.pages = []
        }
    }
    
    func nextPage(skip: Int) -> StoryPage {
        guard currentPageIndex < pages.count - 1 else { return currentPage }
        currentPageIndex += 1 + skip
        return currentPage
    }

}
