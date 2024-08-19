//
//  MovieTableViewCell.swift
//  MoviesDB
//
//  Created by Peter Samir on 18/08/2024.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieAsset: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func prepareCell(movie: Movie) {
        labelName.text = movie.title
        movieAsset.setImage(with: movie.posterPath ?? "")
    }
}
