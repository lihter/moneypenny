import UIKit

class BigProjectCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = String(describing: BigProjectCollectionViewCell.self)

    let cornerRadius: CGFloat = 20
    let cellSize = CGSize(width: 330, height: 150)
    let defaultMargin: CGFloat = .gutter()
    let imageSize = CGSize(width: 90, height: 90)

    var projectTitleLabel: Body1BoldLabel!
    var gradientLayer: CAGradientLayer!
    var gradientView: UIView!
    var cellBackgroundView: UIView!
    var imageView: UIImageView!
    var firstParameterView: SmallParameterView!
    var secondParameterView: SmallParameterView!
    var thirdParameterView: SmallParameterView!
    var discordSocialCounter: SocialCounterView!
    var twitterSocialCounter: SocialCounterView!

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

        firstParameterView.set(title: "Mint price", value: "100 N")
        secondParameterView.set(title: "Supply", value: "99999")
        thirdParameterView.set(title: "Mint date", value: "29 Mar")

        discordSocialCounter.set(value: "1643", socialType: .discord)
        twitterSocialCounter.set(value: "10292", socialType: .twitter)
    }

}
