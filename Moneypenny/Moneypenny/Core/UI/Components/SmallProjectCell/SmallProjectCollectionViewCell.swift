import UIKit

class SmallProjectCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = String(describing: SmallProjectCollectionViewCell.self)

    let cornerRadius: CGFloat = 20
    let cellSize = CGSize(width: 150, height: 150)
    let defaultMargin: CGFloat = .gutter()

    var watchlishButton: WatchlistButton!
    var projectTitleLabel: Body1BoldLabel!
    var gradientLayer: CAGradientLayer!
    var gradientView: UIView!
    var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        gradientLayer.frame = CGRect(
            x: 0,
            y: 0,
            width: cellSize.width,
            height: cellSize.height)
    }

    func set(_ data: ProjectViewModel) {
        projectTitleLabel.text = data.title
        imageView.kf.setImage(with: data.imageUrl)
    }

}
