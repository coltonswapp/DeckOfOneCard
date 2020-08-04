//
//  CardViewController.swift
//  DeckOfOneCard35
//
//  Created by Colton Swapp on 8/4/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func drawButtonTapped(_ sender: Any) {
        CardController.fetchCard { [weak self] (result) in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchCardAndUpdateViews(for: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    private func fetchCardAndUpdateViews(for card: Card) {
            
        CardController.fetchImage(for: card) { (result) in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let cardImage):
                    self.cardImageView.image = cardImage
                    self.cardLabel.text = "\(card.value) of \(card.suit)"
                    
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}
