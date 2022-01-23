//
//  MainPlayerCell.swift
//  Hipip
//
//  Created by Sooraj S Nair on 13/11/21.
//

import UIKit
import AVKit
import AVFoundation

class MainPlayerCell: UITableViewCell {

    @IBOutlet weak var ProfilePicture: UIImageView!
    @IBOutlet weak var HipipButton: UIButton!
    @IBOutlet weak var buttonBG: UIView!
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    
    var playerLayer = AVPlayerLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        HipipButton.ovalCorner()
        buttonBG.roundCorner()
    }
    
    func loadVideo(url:String){
        let videoURL = URL(string: url)
        let player = AVPlayer(url: videoURL!)
         playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.playerView.bounds
        self.playerView.layer.addSublayer(playerLayer)
        playerLayer.videoGravity = .resizeAspectFill
        player.externalPlaybackVideoGravity = .resizeAspectFill
        player.play()
    }

    override func layoutSubviews() {
        playerLayer.frame = self.playerView.bounds
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
