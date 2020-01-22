//
//  UIViewControllerExtension.swift
//  DeckOfOneCard
//
//  Created by Jacob LeCheminant on 1/21/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentErrorToUser(localizedError: LocalizedError) {
        let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }

}
