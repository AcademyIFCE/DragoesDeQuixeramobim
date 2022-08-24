//
//  StoryViewController.swift
//  DragonsOfQuixeramobim
//
//  Created by Gabriela Bezerra on 8/23/22.
//

import UIKit

class StoryViewController: UIViewController {
    
    let viewModel: StoryViewModel = StoryViewModel()
    
    let storyView: StoryView = StoryView(frame: UIScreen.main.bounds)
    
    public override func loadView() {
        super.loadView()
        self.view = storyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self

        storyView.choices = viewModel.choicesForCurrentPage
        storyView.label.text = viewModel.textForCurrentPage
        storyView.delegate = self
    }
    
}

extension StoryViewController: StoryViewModelDelegate {

    func load(text: String, choices: [Choice]) {
        self.storyView.label.text = text
        self.storyView.choices = choices
    }

}

extension StoryViewController: StoryViewDelegate {

    func select(_ choice: Choice) {
        viewModel.select(choice: choice)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.viewModel.nextPage()
        }
    }

}

