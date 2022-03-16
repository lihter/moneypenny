import UIKit
import Kingfisher

extension BigProjectCollectionViewCell: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        cellBackgroundView = UIView()
        contentView.addSubview(cellBackgroundView)

        gradientView = UIView()
        cellBackgroundView.addSubview(gradientView)

        gradientLayer = CAGradientLayer()
        gradientView.layer.insertSublayer(gradientLayer, at: 0)

        projectTitleLabel = Body1BoldLabel()
        contentView.addSubview(projectTitleLabel)

        imageView = UIImageView()
        contentView.addSubview(imageView)

        firstParameterView = SmallParameterView()
        cellBackgroundView.addSubview(firstParameterView)

        secondParameterView = SmallParameterView()
        cellBackgroundView.addSubview(secondParameterView)

        thirdParameterView = SmallParameterView()
        cellBackgroundView.addSubview(thirdParameterView)
    }

    func styleViews() {
        contentView.backgroundColor = .clear
        contentView.layer.masksToBounds = true

        cellBackgroundView.backgroundColor = .white
        cellBackgroundView.layer.cornerRadius = cornerRadius
        cellBackgroundView.layer.masksToBounds = true
        cellBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cellBackgroundView.layer.shadowOpacity = 0.1
        cellBackgroundView.layer.shadowRadius = 16
        cellBackgroundView.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        cellBackgroundView.layer.shadowColor = UIColor.black.cgColor
        cellBackgroundView.layer.borderColor = UIColor(hex: "#00F0FF")?.cgColor ?? UIColor.black.cgColor
        cellBackgroundView.layer.borderWidth = 3

        gradientView.alpha = 1/4
        gradientLayer.type = .axial
        gradientLayer.colors = [
            UIColor(hex: "#00F0FF")?.cgColor ?? UIColor.clear.cgColor,
            UIColor(hex: "#00F0FF")?.withAlphaComponent(0.5).cgColor ?? UIColor.clear.cgColor,
            UIColor(hex: "#00F0FF")?.cgColor ?? UIColor.clear.cgColor
          ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)

        imageView.layer.cornerRadius = cornerRadius
        imageView.layer.masksToBounds = true
//        imageView.kf.setImage(with: url) // set placeholder

        projectTitleLabel.textColor = .black
        projectTitleLabel.numberOfLines = 0
        projectTitleLabel.adjustsFontSizeToFitWidth = true
        projectTitleLabel.lineBreakMode = .byWordWrapping
    }

    func defineLayoutForViews() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        cellBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(26)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(CGFloat.gutter(baseValue: 15))
            $0.size.equalTo(imageSize)
        }

        gradientView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        projectTitleLabel.snp.makeConstraints {
            $0.top.equalTo(cellBackgroundView.snp.top).offset(CGFloat.gutter(baseValue: 15))
            $0.leading.equalTo(imageView.snp.trailing).offset(CGFloat.gutter(baseValue: 15))
            $0.trailing.equalToSuperview().inset(CGFloat.gutter(baseValue: 15))
        }

        firstParameterView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(defaultMargin)
            $0.leading.equalToSuperview().inset(CGFloat.gutter(baseValue: 15))
            $0.bottom.equalToSuperview().inset(defaultMargin)
        }

        secondParameterView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(defaultMargin)
            $0.leading.equalTo(firstParameterView.snp.trailing).offset(CGFloat.gutter(baseValue: 15))
            $0.bottom.equalToSuperview().inset(defaultMargin)
        }

        thirdParameterView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(defaultMargin)
            $0.leading.equalTo(secondParameterView.snp.trailing).offset(CGFloat.gutter(baseValue: 15))
            $0.bottom.equalToSuperview().inset(defaultMargin)
        }
    }

}
