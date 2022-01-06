//
//  DailyWeatherDetailsView.swift
//  Weather
//
//  Created by lion on 5.01.22.
//

import UIKit

final class DailyWeatherDetailsView: UIView {
    
 //MARK: - Creating Views
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.setCornerRadius(with: 15)
        return view
    }()
    
    private let weatherImageView: UIImageView = {
        let image = UIImage()
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let backgroungImageView: UIImageView = {
        let image = UIImage()
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let weatherConditionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    var dataModelView: DailyWeatherDetailsViewModel? {
        didSet {
            compleateDataView()
        }
    }
    
    
        init() {
        super.init(frame: .zero)
        backgroundColor = .systemBlue
        viewSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func compleateDataView() {
        backgroungImageView.image = dataModelView?.backgroungImage
        weatherImageView.image = dataModelView?.weatherImage
        dateLabel.text = dataModelView?.dateString
        temperatureLabel.text = dataModelView?.temperatureString
        weatherConditionLabel.text = dataModelView?.weatherConditionString
    }
   
//MARK: - viewSetup, makeConstraints
    private func viewSetup() {
        addSubview(containerView)
        containerView.addSubview(backgroungImageView)
        containerView.addSubview(weatherImageView)
        containerView.addSubview(dateLabel)
        containerView.addSubview(temperatureLabel)
        containerView.addSubview(weatherConditionLabel)
        
        containerView.snp.makeConstraints { make in
            make.bottom.trailing.leading.equalToSuperview().inset(20)
            make.top.equalTo(safeAreaLayoutGuide)
        }
        
        backgroungImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints { make in
            
        }
        
        dateLabel.snp.makeConstraints { make in
            
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        weatherConditionLabel.snp.makeConstraints { make in
            
        }
        
        
    }
    
}
