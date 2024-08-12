import UIKit
import Lightbox
import SDWebImage

class ViewController: UIViewController, LightboxControllerPageDelegate {
  lazy var showButton: UIButton = { [unowned self] in
    let button = UIButton()
    button.addTarget(self, action: #selector(showLightbox), for: .touchUpInside)
    button.setTitle("Show me the lightbox", for: UIControl.State())
    button.setTitleColor(UIColor(red:0.47, green:0.6, blue:0.13, alpha:1), for: UIControl.State())
    button.titleLabel?.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 30)
    button.frame = UIScreen.main.bounds
    button.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
    return button
  }()
    
    lazy var indexTf: UITextField = { [unowned self] in
        let tf = UITextField()
        tf.text = "0"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        let screenBounds = UIScreen.main.bounds
        tf.frame = CGRect(x: 100, y: screenBounds.height / 2 - 100, width: screenBounds.width - 200, height: 30)
        return tf
    }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
    view.backgroundColor = UIColor.white
    view.addSubview(showButton)
    view.addSubview(indexTf)
    title = "Lightbox"
    LightboxConfig.preload = 2
    LightboxConfig.loadImage = { imageView, url, completion in
      imageView.sd_setImage(with: url) { image, _, _ , _ in
        completion?(image)
      }
    }
  }
  
  // MARK: - Action methods
  
    @objc func showLightbox() {
        let images = [
            LightboxImage(imageURL: URL(string: "https://media.giphy.com/media/Ku65904QQe4yez448B/giphy.gif")!),
            LightboxImage(fileURL: URL(string: "https://media.giphy.com/media/ontKwPWJxARsuKaKqJ/giphy.gif")!),
            LightboxImage(imageURL: URL(string: "https://media.giphy.com/media/lQDLwWUMPaAHvh8pAG/giphy.gif")!),
            LightboxImage(imageURL: URL(string: "https://media.giphy.com/media/ontKwPWJxARsuKaKqJ/giphy.gif")!),
            
            LightboxImage(fileURL: URL(string: "https://media.giphy.com/media/ontKwPWJxARsuKaKqJ/giphy.gif")!),
            LightboxImage(fileURL: URL(string: "https://media.giphy.com/media/ontKwPWJxARsuKaKqJ/giphy.gif")!),
            LightboxImage(fileURL: URL(string: "https://media.giphy.com/media/ontKwPWJxARsuKaKqJ/giphy.gif")!),
            
            LightboxImage(
                image: UIImage(named: "photo1")!,
                text: "Photography is the science, art, application and practice of creating durable images by recording light or other electromagnetic radiation, either electronically by means of an image sensor, or chemically by means of a light-sensitive material such as photographic film"
            ),
            
            LightboxImage(imageURL: URL(string: "https://via.placeholder.com/300.png/09f/fff")!),
            
            
            LightboxImage(
                image: UIImage(named: "photo2")!,
                text: "Emoji 😍 (/ɪˈmoʊdʒi/; singular emoji, plural emoji or emojis;[4] from the Japanese 絵文字えもじ, pronounced [emodʑi]) are ideograms and smileys used in electronic messages and web pages. Emoji are used much like emoticons and exist in various genres, including facial expressions, common objects, places and types of weather 🌅☔️💦, and animals 🐶🐱",
                videoURL: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            ),
            LightboxImage(
                image: UIImage(named: "photo3")!,
                text: "A lightbox is a translucent surface illuminated from behind, used for situations where a shape laid upon the surface needs to be seen with high contrast."
            ),
            LightboxImage(imageURL: URL(string: "https://c.tenor.com/kccsHXtdDn0AAAAC/alcohol-wine.gif")!),
            LightboxImage(fileURL: URL(string: "https://media.giphy.com/media/ontKwPWJxARsuKaKqJ/giphy.gif")!),
            LightboxImage(fileURL: URL(string: "https://media.giphy.com/media/ontKwPWJxARsuKaKqJ/giphy.gif")!),
            LightboxImage(fileURL: URL(string: "https://media.giphy.com/media/ontKwPWJxARsuKaKqJ/giphy.gif")!)
        ]
        let customView = UIView()
        customView.backgroundColor = .red
        let controller = LightboxController()
        controller.pageDelegate = self
        controller.customPageView = customView
        controller.images = images
        var index = 0
        if let myNumber = NumberFormatter().number(from: indexTf.text ?? "0") {
            index = myNumber.intValue
        }
        controller.goTo(index, animated: true)
        controller.dynamicBackground = true
        present(controller, animated: true, completion: nil)
    }
    
    func lightboxController(_ controller: Lightbox.LightboxController, didMoveToPage page: Int) {

    }
    
    func lightboxController(_ controller: Lightbox.LightboxController, preloadCustomPageViewAtIndex index: Int, completed: (UIView) -> Void) {
        let view = UIView()
        if index == 1 {
            view.backgroundColor = .red
        }else if index == 4 {
            view.backgroundColor = .green
        } else if index == 5 {
            view.backgroundColor = .blue
        } else if index == 6 {
            view.backgroundColor = .white
        }else if index == 12 {
            view.backgroundColor = .green
        } else if index == 13 {
            view.backgroundColor = .blue
        } else if index == 14 {
            view.backgroundColor = .white
        }
        completed(view)
    }
}

