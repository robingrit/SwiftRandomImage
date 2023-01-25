//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Robin on 2023-01-25.
//

import UIKit

class ViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
        
       
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)

        return button
    }()
    
    let colors: [UIColor] = [
        .systemBlue,
        .systemRed,
        .systemGray,
        .systemPink,
        .systemOrange,
        .systemGreen,
        .systemYellow,
        .systemIndigo
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        getRandomPhoto()
        // Do any additional setup after loading the view.
    }
    
    @objc func tapButton(){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.layer.cornerRadius = 8
        button.layer.cornerCurve = .continuous
        button.frame = CGRect(x: 60, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-120, height: 55)
    }
    func getRandomPhoto(){
        let urlString = "https://picsum.photos/600/600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data: data)
    }


}

