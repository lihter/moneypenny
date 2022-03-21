import UIKit

extension UIView {

    public func applyGradient(
        locations: [NSNumber],
        colors: [CGColor],
        startPoint: CGPoint? = nil,
        endPoint: CGPoint? = nil,
        at: Int = 0,
        ignoreIfGradientExists: Bool = true
    ) {
        let hasGradient = (layer.sublayers ?? []).filter { $0 is CAGradientLayer }.count > 0

        if ignoreIfGradientExists && hasGradient {
            return
        }

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.locations  = locations
        gradientLayer.colors = colors
        if let startPoint = startPoint {
            gradientLayer.startPoint = startPoint
        }
        if let endPoint = endPoint {
            gradientLayer.endPoint = endPoint
        }
        layer.insertSublayer(gradientLayer, at: UInt32(at))
    }

}
