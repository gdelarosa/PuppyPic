//
//  ViewController.swift
//  PuppyPic
//
//  Created by Gina De La Rosa on 10/4/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var recipes: [Puppy] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RecipeRouter.getResults { [weak self] recipes in
            self?.recipes = recipes
            self?.collectionView.reloadData()
            
        }
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PuppyCollectionViewCell
        cell.recipe(result: recipes[indexPath.row])
        return cell
    }
}

