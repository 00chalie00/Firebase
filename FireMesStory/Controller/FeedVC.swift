//
//  FeedVC.swift
//  FireMesStory
//
//  Created by formathead on 2019/11/05.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userCommentLbl: UILabel!
    @IBOutlet weak var userTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func logOutBtnClicked(_ sender: Any) {
        
    }
    
    
    
}//End Of The Class

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = userTableView.dequeueReusableCell(withIdentifier: "feedcell") as? FeedCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
