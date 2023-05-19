//
//  ViewController.swift
//  YouTubeAppPADC
//
//  Created by Myo Thandar soe on 16/03/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewVideos: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTableView()
    }
    private func setUpTableView() {
        tableViewVideos.register(UINib(nibName: String(describing: VideoItemTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: VideoItemTableViewCell.self))
        tableViewVideos.dataSource = self
        tableViewVideos.delegate = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VideoItemTableViewCell.self)) as? VideoItemTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Navigate
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VideoDetailsViewController = storyboard.instantiateViewController(withIdentifier: String(describing: VideoDetailsViewController.self))
        navigationController?.pushViewController(VideoDetailsViewController, animated: true)
        
    }
}

