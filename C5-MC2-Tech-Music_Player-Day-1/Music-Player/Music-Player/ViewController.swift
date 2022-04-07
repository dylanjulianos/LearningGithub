//
//  ViewController.swift
//  Music-Player
//
//  Created by Allicia Viona Sagi on 02/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    /// Data
    /// Music 1
    var musicTitle: String = "Happy"
    var musicSinger: String = "Pharrell Williams"
    var musicLyrics = "Huh (Because I'm happy) Clap along if you feel like a room without a roof (Because I'm happy) Clap along if you feel like happiness is the truth (Because I'm happy) Clap along if you know what happiness is to you"
    var musicImage: UIImage = UIImage(named: "happy.jpg")!
    var musicFavorite: Bool = false
    
    /// Music 2
    var musicTitle2: String = "Daydreamer"
    var musicSinger2: String = "AURORA"
    var musicLyrics2 = "And we become night time dreamers Street walkers and small talkers When we should be daydreamers And moonwalkers and dream talkers And we become night time dreamers Street walkers, small talkers When we should be daydreamers And moonwalkers and dream talkers In real life"
    var musicImage2: UIImage = UIImage(named: "daydreamer.jpg")!
    var musicFavorite2: Bool = false
    
    /// Music 3
    var musicTitle3: String = "Is This Love"
    var musicSinger3: String = "Aalia"
    var musicLyrics3 = "A blue bird in my heart Why do you try to get it out It's sad It's sad to know you Don't take out my blue bird It only knows how to stay dark Don't spoil It shouldn't hurt no more"
    var musicImage3: UIImage = UIImage(named: "is-this-love.jpg")!
    var musicFavorite3: Bool = false
    
    /// Data Control
    var currMusic: Int? = 5
    var isPlaying = false
    var isFavorite = false
    
    /// Outlets
    @IBOutlet weak var imageCoverImage: UIImageView!
    @IBOutlet weak var imageBackground: UIImageView!
    
    @IBOutlet weak var lyricsTextView: UITextView!
    
    @IBOutlet weak var musicDurationSlider: UISlider!
    
    @IBOutlet weak var musicTitleLbl: UILabel!
    @IBOutlet weak var musicSingerLbl: UILabel!
    @IBOutlet weak var currTimeLbl: UILabel!
    @IBOutlet weak var timeLeftLbl: UILabel!
    
    @IBOutlet weak var prevMusicBtn: UIButton!
    @IBOutlet weak var playMusicBtn: UIButton!
    @IBOutlet weak var nextMusicBtn: UIButton!
    
    @IBOutlet weak var favoriteBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set up the first music cover
        imageCoverImage.image = musicImage2
        
        // Set up the first music title
        if let idx = currMusic {
            musicTitleLbl.text = "\(idx) \(musicTitle2)"
        } else {
            musicTitleLbl.text = "\(musicTitle2)"
        }
        
        
        // Set up the first music singer
        //musicSingerLbl.text = musicSinger2
        musicSingerLbl.text = "\(musicTitle2) - \(musicSinger2)"
        
        // Set up lyrics
        lyricsTextView.text = musicLyrics2
        
        // Set up background
        imageBackground.image = musicImage2
        
        // Set UISlider starting value and ending value
        musicDurationSlider.minimumValue = 0
        musicDurationSlider.maximumValue = 3
        
        // Set UISlider value to starting position
        musicDurationSlider.setValue(0, animated: true)
        
        // To notify the changeLyrics function when textView value changed
        NotificationCenter.default.addObserver(self, selector: #selector(changeLyrics), name: UITextView.textDidChangeNotification, object: nil)
        
        // To blur background
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView()
        blurEffectView.frame = CGRect(x: 0, y: 0, width: imageBackground.frame.width + 30 , height: imageBackground.frame.height)
        blurEffectView.center = imageBackground.center
        self.imageBackground.addSubview(blurEffectView)
        UIView.animate(withDuration: 5) {
            blurEffectView.effect = blurEffect
        }
        
    }
    
    @IBAction func pressNext(_ sender: Any) {
        imageCoverImage.image = musicImage3
        imageBackground.image = musicImage3
        musicTitleLbl.text = musicTitle3
        musicSingerLbl.text = musicSinger3
        lyricsTextView.text = musicLyrics3
        
    }
    
    @IBAction func pressPrev(_ sender: Any) {
        imageCoverImage.image = musicImage
        imageBackground.image = musicImage
        musicTitleLbl.text = musicTitle
        musicSingerLbl.text = musicSinger
        lyricsTextView.text = musicLyrics
    }
    
    @objc func changeLyrics() {
        musicLyrics = lyricsTextView.text
    }
    
    
    @IBAction func pressPlay(_ sender: Any) {
        
        //musicDurationSlider.setValue(3, animated: true)
        //timeLeftLbl.text = "03.00"
        let playButton = UIImage(systemName: "play.fill")
        let pauseButton = UIImage(systemName: "pause.fill")
        if isPlaying{
            playMusicBtn.setImage(pauseButton, for: .normal)
            
        }else{
            playMusicBtn.setImage(playButton, for: .normal)
            
        }
        
        //It's a MUST
        isPlaying = !isPlaying
        
    }
    
    @IBAction func pressFavorite(_ sender: Any){
        
        let favorite = UIImage(systemName: "heart")
        let favorited = UIImage(systemName: "heart.fill")
        
        if isFavorite{
            favoriteBtn.setImage(favorite, for: .normal)
            
        }else{
            favoriteBtn.setImage(favorited, for: .normal)
            
        }
        
        isFavorite = !isFavorite
    }

}
