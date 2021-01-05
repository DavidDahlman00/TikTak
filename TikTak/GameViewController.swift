//
//  GameViewController.swift
//  TikTak
//
//  Created by David Dahlman on 2021-01-03.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   

    var difficulty: String?
    
    @IBOutlet weak var gameText: UILabel!
    
    private let colletionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colletionView.register(GameViewCell.self, forCellWithReuseIdentifier: GameViewCell.identifier)
        colletionView.delegate = self
        colletionView.dataSource = self
        view.addSubview(colletionView)
        gameText.text = difficulty
    }
    
    override func viewDidLayoutSubviews() {
        colletionView.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameViewCell.identifier,
                                                      for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/3)-3,
                      height: (view.frame.size.width/3)-3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
  
    @IBAction func exitButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    
    }
    
}
