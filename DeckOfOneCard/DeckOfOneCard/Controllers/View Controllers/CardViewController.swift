//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Jacob LeCheminant on 1/21/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var suitAndValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func drawButtonTapped(_ sender: UIButton) {
        CardController.fetchCard { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                
                case .success(let card):
                    self?.fetchImageAndUpdateViews(for: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    func fetchImageAndUpdateViews(for card: Card) {
        CardController.fetchImage(for: card) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let image):
                    self?.suitAndValueLabel.text = "\(card.value) of \(card.suit)"
                    self?.imageView.image = image
                    
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}
