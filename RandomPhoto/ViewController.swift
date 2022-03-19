//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Preet Singh on 20/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
     @objc func didTapButton(){
        getRandomPhoto()
         view.backgroundColor = colors.randomElement()
    }
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGreen,
        .systemYellow,
        .systemPurple
    ]
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 20,
                              y: view.frame.size.height-50-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 50)
        
    }
    
    private let imageView: UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Get Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return  button
    }()
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url)else{
            return
        }
        imageView.image = UIImage(data: data)
        
    }
    
    


}

