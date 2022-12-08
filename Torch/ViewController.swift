import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let imageOn = UIImage(named: "torchImgOff.png")
    let imageOff = UIImage(named: "torchImgOn.png")
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var torchButton: UIButton!
    
    @IBAction func buttonOn(_ sender: Any) {

        let device = AVCaptureDevice.default(for: AVMediaType.video)
        
        if device!.hasTorch {
            do {
                try device?.lockForConfiguration()
                device?.torchMode = device?.torchMode == AVCaptureDevice.TorchMode.on ? . off : .on
                device?.unlockForConfiguration()
            } catch {
                print("error")
            }
        }
        if device?.torchMode == AVCaptureDevice.TorchMode.off {
            torchButton.setBackgroundImage(imageOn, for: UIControl.State.normal)
        } else {
            torchButton.setBackgroundImage(imageOff, for: UIControl.State.normal)
        }
    }
    
    override func viewDidLoad() {
        
        torchButton.setBackgroundImage(imageOn, for: UIControl.State.normal)
        
        backgroundView.backgroundColor = UIColor.black
        super.viewDidLoad()
    }
    
}

