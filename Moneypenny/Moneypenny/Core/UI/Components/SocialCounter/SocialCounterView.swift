import UIKit

class SocialCounterView: UIView {

    var valueView: UIView!
    var valueLabel: Body1BoldLabel!
    var imageView: UIImageView!

    let viewWidth: CGFloat = .gutter(baseValue: 26)
    let imageSize = CGSize(width: 18, height: 18)
    let defaultMargin: CGFloat = .gutter(baseValue: 10)

    init() {
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(value: String, socialType: SocialType) {
        valueLabel.text = value
        switch socialType {
        case .discord:
            imageView.image = UIImage(with: .discord)
            backgroundColor = .discordPrimary
        case .twitter:
            imageView.image = UIImage(with: .twitter)
            backgroundColor = .twitterPrimary
        }
        valueLabel.sizeToFit()
    }

}
