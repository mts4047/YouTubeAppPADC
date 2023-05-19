//
//  VideoDetailsViewController.swift
//  YouTubeAppPADC
//
//  Created by Myo Thandar soe on 17/03/2023.
//

import Foundation
import UIKit
import AVKit

class VideoDetailsViewController : UIViewController {
    
    @IBOutlet weak var viewContainerVideoPlayer : UIView!
    @IBOutlet weak var btnBack : UIButton!
    
    
    let avPlayerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpVideoPlayer()
        btnBack.setTitle("", for: .normal)
        btnBack.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        
    }
    
    @objc func didTapBack(){
        navigationController?.popViewController(animated: true)
    }
  
    
    private func setUpVideoPlayer() {
        
        addChild(avPlayerController)
        viewContainerVideoPlayer.addSubview(avPlayerController.view)
        avPlayerController.view.translatesAutoresizingMaskIntoConstraints = false
        avPlayerController.view.leadingAnchor.constraint(equalTo: viewContainerVideoPlayer.leadingAnchor).isActive = true
        avPlayerController.view.trailingAnchor.constraint(equalTo: viewContainerVideoPlayer.trailingAnchor).isActive = true
        avPlayerController.view.topAnchor.constraint(equalTo: viewContainerVideoPlayer.topAnchor).isActive = true
        avPlayerController.view.bottomAnchor.constraint(equalTo: viewContainerVideoPlayer.bottomAnchor).isActive = true
        
        let avPlayer = AVPlayer(url: URL(string: "https://jsoncompare.org/LearningContainer/SampleFiles/Video/MP4/sample-mp4-file.mp4")!)
        avPlayerController.player = avPlayer
        avPlayer.play()
        
        
    }
}
