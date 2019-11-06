//
//  FeedCell.swift
//  FireMesStory
//
//  Created by formathead on 2019/11/06.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userCommentLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(email: String, userImg: UIImage, comment: String) {
        self.userEmailLbl.text = email
        self.userImg.image = userImg
        self.userCommentLbl.text = comment
    }

}//End Of The Class

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
