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
    @IBOutlet weak var descriptionLabl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func prepareCell(movie: Movie) {
        labelName.text = movie.title
        descriptionLabl.text = movie.overview
        movieAsset.setImage(with: movie.posterPath ?? "")
    }
}
