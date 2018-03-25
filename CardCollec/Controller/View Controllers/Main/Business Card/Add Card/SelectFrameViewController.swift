//
//  AddCardViewController.swift
//  CardCollec
//
//  Created by Sung Jae Min on 1/22/18.
//  Copyright © 2018 CardCollec. All rights reserved.
//

import UIKit

class SelectFrameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    let cellId = "cellId"
    var frameNum: Int = 0
    
    /**
     *  Create a collection view for card frames.
     **/
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    /**
     * Create a page indicator to show current looking card frame and remaining number of card frames.
     **/
    lazy var pageController: UIPageControl = {
        let pc = UIPageControl()
        
        pc.pageIndicatorTintColor = UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0)
        pc.currentPageIndicatorTintColor = UIColor(displayP3Red: 237/255, green: 145/255, blue: 33/255, alpha: 1.0)
        pc.numberOfPages = self.cardFrames.count
        pc.translatesAutoresizingMaskIntoConstraints = false
        
        return pc
    }()
    
    let tooltipTextView: UITextView = {
       
        let textView = UITextView()
        textView.text = "You can change color and font of your card anytime."
        textView.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        textView.backgroundColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0)
        textView.textColor = .black
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    /**
     * Add card frames to the collection view.
     **/
 
    let cardFrames: [CardFrame] = {
        let firstFrame = CardFrame(title: "Regular", imageName: "cardframe_regular")
        let secondFrame = CardFrame(title: "Vertical", imageName: "cardframe_vertical")
        
        return [firstFrame,secondFrame]
    }()
    
    let selectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(displayP3Red: 237/255, green: 145/255, blue: 33/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.addTarget(self, action: #selector(clickedSelectButton(sender:)), for: .touchUpInside)
        
        return button
        
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.addTarget(self, action: #selector(clickedCancelButton), for: .touchUpInside)
        
        return button
    }()
    
    /**
     * Gather all the functions that are using in the current view controller
     **/
    
    func setupView(){
        view.backgroundColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0)
        addSubviews()
        addConstraints()
        setupCollectionView()
        setupNavigationBar()
    }
    
    /**
     * Setup anchors and background of collection view
     **/
    
    func setupCollectionView(){
        collectionView.backgroundColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0)
        collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        registerCells()
    }
    
    /**
     * Register cells for collection view
     **/
    
    func registerCells() {
        collectionView.register(CardFrameCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    /**
     * Let controller knows the current page of cell in collection viewß
     **/
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageController.currentPage = pageNumber
        
        if(pageNumber==0){
            frameNum = 0
            
        }
        else{
            frameNum = 1
        }
    }
    
    /**
     * Set up navigation bar
     **/
    
    func setupNavigationBar(){
        navigationController?.isNavigationBarHidden = true
    }
    
    /**
     * Add subviews for the main view of this controller
     **/
    
    func addSubviews(){
        view.addSubview(collectionView)
        view.addSubview(pageController)
        view.addSubview(selectButton)
        view.addSubview(cancelButton)
        //view.addSubview(tooltipTextView)
    }
    
    /**
     * Contain all the constraints of subviews in the main view
     **/
    
    func addConstraints(){
        pageControllerConstraint()
        //tooltipTextViewConstraint()
        selectButtonConstraint()
        cancelButtonConstraint()
    }
    
    /**
     * Constraint of page controller subview in the main view
     **/
    
    func pageControllerConstraint(){
        pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageController.bottomAnchor.constraint(equalTo: selectButton.topAnchor, constant: -30).isActive = true
        pageController.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    /**
     * Constraint of frame label subview in the main view
     **/
    /*
    func tooltipTextViewConstraint(){
        tooltipTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tooltipTextView.bottomAnchor.constraint(equalTo: selectButton.topAnchor, constant: -5).isActive = true
        tooltipTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        tooltipTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    */
    /**
     * Constraint of select button subview in the main view
     **/
    
    func selectButtonConstraint(){
        selectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor).isActive = true
        selectButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        selectButton.heightAnchor.constraint(equalToConstant: 49).isActive = true
    }
    
    func cancelButtonConstraint(){
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 49).isActive = true
    }
    
    /**
     * Return number of card frames in the collection view
     **/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardFrames.count
    }
    
    /**
     * Calling reusable cell accordingly
     **/
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CardFrameCell
        
        let cardFrame = cardFrames[indexPath.item]
        cell.cardFrame = cardFrame

        return cell
    }
    
    /**
     * Setup layout of collection view
     **/
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    /**
     * Handle select button when it is clicked
     **/
    
    @objc func clickedSelectButton(sender:UIButton){
        let addName = AddNameViewController()
        //let bcard = BusinessCardViewController()
      
        //bcard.updateCard(index: 0, frame: frameNum, title: "", name: "hello", email: "sm", address: "", phoneNumber: 0)

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationController?.pushViewController(addName, animated: true)
    }
    
    @objc func clickedCancelButton(){
        navigationController?.popToRootViewController(animated: true)
    }
}
