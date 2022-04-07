//
//  MusicFeeder.swift
//  Music-Player
//
//  Created by Dylan Juliano Santoso on 06/04/22.
//

import Foundation
import UIKit

struct MusicFeeder{
    
    func seedMusic() -> [Music] {
        return [Music(title: "Daydreamer", singer: "AURORA", cover: UIImage(named: "daydreamer.jpg")),
                Music(title: "Daydreamer", singer: "AURORA", cover: UIImage(named: "daydreamer.jpg")),
                Music(title: "Daydreamer", singer: "AURORA", cover: UIImage(named: "daydreamer.jpg"))]
    }
}
