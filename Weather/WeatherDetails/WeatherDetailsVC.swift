//
//  WeatherDetailsVC.swift
//  Weather
//
//  Created by lion on 3.01.22.
//

import UIKit
import SnapKit

final class WeatherDetailsVC: UIViewController {
    
    lazy var interactor: WeatherDetailsInteractor = {
        let interactor = WeatherDetailsInteractor()
        interactor.vc = self
        return interactor
    }()
    // создание экземпляров классов вьюх
    private let dailyWeatherDetailsView = DailyWeatherDetailsView()
    private let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewSetup()
        tableViewSetup()
    }

    
    
//MARK: - viewSetup, makeConstraints
    private func viewSetup() {
        view.addSubview(dailyWeatherDetailsView)
        view.addSubview(tableView)
        // ставим констрейнты
        dailyWeatherDetailsView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        tableView.snp.makeConstraints { make in
            make.bottom.trailing.leading.equalToSuperview()
            make.top.equalTo(dailyWeatherDetailsView.snp.bottom)
            
        }
        
        tableView.backgroundColor = .clear
        tableView.setShadow()
        tableView.separatorStyle = .none
        
        
    }
    
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DailyWeatherCell.self, forCellReuseIdentifier: DailyWeatherCell.identifier)
        tableView.contentInset.top = 16
        tableView.rowHeight = UITableView.automaticDimension
        
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension WeatherDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherCell.identifier, for: indexPath) as! DailyWeatherCell
        cell.dataModelCell = interactor.dataSource[indexPath.row]
        
        // убираем визуал нажатия по ячейке
        cell.selectionStyle = .none
        
        // уставливаем кастомный сепаратор из экстеншена, кроме последней и если одна ячейка всего
        if indexPath.row != interactor.dataSource.count - 1, interactor.dataSource.count > 1 {
            cell.conteinerView.addSeparatorLine(color: .gray.withAlphaComponent(0.2), leading: 16, trailing: 0)
        }
        
        
        
        // устанавливаем кастомные радиусы для контейнера ячеек( первой и последней)
        if indexPath.row == 0 {
            DispatchQueue.main.async {
                cell.conteinerView.addRoundCorners(corners: [.topLeft, .topRight], cornerRadius: 13.0)
            }
        }
        
        if indexPath.row == interactor.dataSource.count - 1 {
            DispatchQueue.main.async {
                cell.conteinerView.addRoundCorners(corners: [.bottomLeft, .bottomRight], cornerRadius: 13.0)
            }
        }
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
