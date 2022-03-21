import UIKit

extension SocialCounterView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        valueView = UIView()
        addSubview(valueView)

        valueLabel = Body1BoldLabel()
        valueView.addSubview(valueLabel)

        imageView = UIImageView()
        addSubview(imageView)
    }

    func styleViews() {
        valueLabel.textColor = .moneyWhite
        valueLabel.textAlignment = .right
        valueLabel.transform = CGAffineTransform(rotationAngle: -.pi / 2)
    }

    func defineLayoutForViews() {
        snp.makeConstraints {
            $0.width.equalTo(viewWidth)
        }

        valueView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(CGFloat.gutter(baseValue: 15))
            $0.leading.trailing.equalToSuperview()
        }

        valueLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        imageView.snp.makeConstraints {
            $0.top.equalTo(valueView.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(CGFloat.gutter(baseValue: 15))
            $0.size.equalTo(imageSize)
        }
    }

}
