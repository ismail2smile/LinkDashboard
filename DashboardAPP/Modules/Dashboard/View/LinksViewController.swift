//
//  LinksViewController.swift
//  DashboardAPP
//
//  Created by SPURGE on 13/06/23.
//

import UIKit

class LinksViewController: UIViewController,YSTabBarCoorinator {
  
    // MARK: - Properties
    
    var linksViewModel: DashboardViewModel!
    let item: UITabBarItem = {
        let icon = UIImage(named: "link-25")
        let item = UITabBarItem(title: Constants.Screen.link, image: icon, selectedImage: nil)
        return item
    }()
    var correctedInsets: UIEdgeInsets = .zero
    
    
    // MARK: - UI Elements
    @IBOutlet weak var screenTitleLBL : UILabel!
    @IBOutlet weak var mainContentView : UIView!
    
    @IBOutlet weak var linksTableView : UITableView!
    private let headerView: AnalyticalHedderView = {
          let header = AnalyticalHedderView.loadFromNib()
          return header
      }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainContentView.isHidden = true
        confirmLinkviewProtocol()
        fetchApi()
        setupLabeFont()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func setupTableView(){
        setTableViewDelegates()
        registerNibsForTableView()
    }
    
    func setTableViewDelegates(){
        linksTableView.delegate = self
        linksTableView.dataSource = self
    }
    func registerNibsForTableView(){
        self.linksTableView.register(UINib(nibName: "LinkTableViewCell", bundle: nil), forCellReuseIdentifier: "LinkTableViewCell")
        self.linksTableView.register(UINib(nibName: "BottomTableViewCell", bundle: nil), forCellReuseIdentifier: "BottomTableViewCell")
        linksTableView.tableHeaderView = headerView
        headerView.delegate = self
    }
    func setupLabeFont(){
        screenTitleLBL.setFigFontSemiBold(size: 24)
    }
    func confirmLinkviewProtocol(){
        linksViewModel.linkViewDelegate = self
    }
    func fetchApi(){
        linksViewModel.fetchDashboard()
    }
 
}

extension LinksViewController: LinkViewControllerDelegate{
    func apiSuccess() {
        DispatchQueue.main.async {
            self.linksViewModel.getFlowAnalyticArray()
            self.headerView.analyticData = self.linksViewModel.analyticDM
            self.headerView.overAllClickChart = self.linksViewModel.groupGraphAndProject()
            self.headerView.setupChart()
            self.headerView.reloadanalytic()
            self.linksTableView.reloadData()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.mainContentView.isHidden = false
        }
        
    }
    
    func apiFailed(error: Error) {
        print(error)
        DispatchQueue.main.async {
            Utils.showAlert(title: "Api Error", message: error.localizedDescription, viewController: self)
        }
    }
    
    
}


extension LinksViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowsCount: Int!
        
        if self.headerView.isTopLinkLoad{
            rowsCount  = linksViewModel.dashboardData?.data?.top_links?.count ?? 0
        }else{
            rowsCount  = linksViewModel.dashboardData?.data?.recent_links?.count ?? 0
        }
        if rowsCount > 0
        {
            return rowsCount + 1
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var rowsCount: Int!
        
        if self.headerView.isTopLinkLoad{
            rowsCount  = linksViewModel.dashboardData?.data?.top_links?.count ?? 0
        }else{
            rowsCount  = linksViewModel.dashboardData?.data?.recent_links?.count ?? 0
        }
        
        
        if indexPath.row < rowsCount{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LinkTableViewCell", for: indexPath) as? LinkTableViewCell else {
                fatalError("Unable to dequeue ToDoTableViewCell")
            }
            
            let item : Link!
            if self.headerView.isTopLinkLoad{
                item =  linksViewModel.dashboardData?.data?.top_links![indexPath.row]
            }else{
                item =  linksViewModel.dashboardData?.data?.recent_links![indexPath.row]
            }
            cell.setDataTocell(item: item)
           
            
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BottomTableViewCell", for: indexPath) as? BottomTableViewCell else {
                fatalError("Unable to dequeue ToDoTableViewCell")
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowsCount = linksViewModel.dashboardData?.data?.recent_links?.count ?? 0
        
        if indexPath.row < rowsCount{
            return 130
        }
        
        return 231
    }
}

extension LinksViewController: UITableViewDelegate{

}

extension LinksViewController: HeaderViewProtocol{
    func reloadTableViewData() {
        self.linksTableView.reloadData()
    }
}
