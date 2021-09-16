import UIKit

class WeatherVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var localizationTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var airPollutionButton: UIButton!
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    
    //MARK: - Properties
    var apiCaller = APICaller()
    
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        localizationTextField.delegate = self
        imageShadow(weatherImage)
        buttonShadow(airPollutionButton)
    }
    
    //MARK: - Actions
    @IBAction func airPollutionStatusPressed(_ sender: UIButton) {
    }
    
    @IBAction func localizeMePressed(_ sender: Any) {
    }
    
    //MARK: - Methods
    func imageShadow(_ image: UIImageView){
        image.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        image.layer.shadowOpacity = 1
        image.layer.shadowOffset = CGSize.init(width: 2, height: 2)
        image.layer.shadowRadius = 5
    }
    
    func buttonShadow(_ button: UIButton){
        button.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize.init(width: 2, height: 2)
        button.layer.shadowRadius = 5
    }
}

//MARK: - UICollectionView Data Source Methods
extension WeatherVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

//MARK: - UITextField Delegate Methods
extension WeatherVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        localizationTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = localizationTextField.text{
            print("Hey sir, I got a city. It is \(city)")
            apiCaller.createURLString(city: city)
        }
        localizationTextField.text = ""
    }
}


