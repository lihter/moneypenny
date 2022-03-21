import UIKit
import Kingfisher

extension SmallProjectCollectionViewCell: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        imageView = UIImageView()
        contentView.addSubview(imageView)

        gradientView = UIView()
        contentView.addSubview(gradientView)

        gradientLayer = CAGradientLayer()
        gradientView.layer.insertSublayer(gradientLayer, at: 0)

        projectTitleLabel = Body1BoldLabel()
        contentView.addSubview(projectTitleLabel)

        dateLabel = Body4MediumLabel()
        contentView.addSubview(dateLabel)

        watchlishButton = WatchlistButton()
        contentView.addSubview(watchlishButton)
    }

    func styleViews() {
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true

        gradientLayer.type = .axial
        gradientLayer.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
          ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)

        imageView.image = UIImage(with: .projectLogoPlaceholder)

        projectTitleLabel.textColor = .moneyWhite
        projectTitleLabel.numberOfLines = 0
        projectTitleLabel.adjustsFontSizeToFitWidth = true
        projectTitleLabel.lineBreakMode = .byWordWrapping

        dateLabel.textColor = .moneyWhite
    }

    func defineLayoutForViews() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        gradientView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        projectTitleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(CGFloat.gutter(baseValue: 15))
        }

        dateLabel.snp.makeConstraints {
            $0.top.equalTo(projectTitleLabel.snp.bottom).offset(CGFloat.gutter(baseValue: 5))
            $0.leading.trailing.equalToSuperview().inset(CGFloat.gutter(baseValue: 15))
            $0.bottom.equalToSuperview().inset(defaultMargin)
        }

        watchlishButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(defaultMargin)
            $0.trailing.equalToSuperview().inset(defaultMargin)
        }
    }

}
