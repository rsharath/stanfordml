//
//  CalendarViewController.swift
//  PowerBuilder
//
//  Created by Sharath Rajasekar on 10/16/18.
//  Copyright © 2018 Chicory LLC. All rights reserved.
//

import UIKit
import JTAppleCalendar
import CoreData


class CalendarViewController : UIViewController {

    var exerciseContainer : [ExerciseRecord] = []
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBAction func doneTapped(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let outsideMonthColor = UIColor(colorWithHexValue: 0x584a66)
    let monthColor = UIColor.white
    let selectedMonthColor = UIColor(colorWithHexValue: 0x3a294b)
    //let currentDateSelectedViewColor = UIColor(colorWithHexValue: 0xfed766)
    
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCalendarView()
    }
    
    // function for setting up calendar views
    func setupCalendarView() {
        // setup calendar spacing
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        // setup labels
        calendarView.visibleDates {visibleDates in
            self.updateMonthOfCalendarOnScroll(from: visibleDates)
        }
    }// end setupCalendarView
    
    //handle cell deselected event
    func handleCellDeselected(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else {return}
        
        // if a cell was already selected once, then deselect it
        if (validCell.selectedView.isHidden == false) {
            validCell.selectedView.isHidden = true
        }
    }
    
    // reset random cell markings
    func resetRandomCellMarkings(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else {return}

        if (cellState.isSelected) {
            validCell.selectedView.isHidden = false
        }
        else {
            validCell.selectedView.isHidden = true
        }
    }

    // function to handle cells when they are selected by user
    func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
        //guard let validCell = view as? CustomCell else {return}
        
        if cellState.isSelected {
            //validCell.selectedView.isHidden = false
            exerciseContainer.removeAll()
            queryExerciseDate(date: cellState.date)
            let index = exerciseContainer.count
            if (index != 0) {
                //found value
                exerciseNameLabel.text = exerciseContainer[index-1].workout
                formatter.dateFormat = "HH:mm a 'on' MMMM dd, yyyy"
                dateLabel.text = formatter.string(from: exerciseContainer[index-1].date!)
            }
            else {
                exerciseNameLabel.text = ""
                dateLabel.text = ""
            }
        }
    }//end handleCellSelected
    
    // function for updating MONTH & YEAR of the calendar when user scrolls (or first time render)
    func updateMonthOfCalendarOnScroll(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        formatter.dateFormat = "yyyy"
        year.text = formatter.string(from: date)
        
        formatter.dateFormat = "MMMM"
        month.text = formatter.string(from: date)
        
        // init the rest of labels
        dateLabel.text = ""
        exerciseNameLabel.text = ""
        
        //todo: pull in dates when I did the exercise and update the calendar
    }
    
    // function for handling text colors for month & non-month dates
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else {return}
        
        if cellState.isSelected {
            validCell.dataLabel.textColor = selectedMonthColor
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dataLabel.textColor = monthColor
            }
            else {
                validCell.dataLabel.textColor = outsideMonthColor
            }
        }
    }// end func
    
    
    // function to mark today's dates on the calendar
    func colorTodaysDate(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else {return}
        
        // now mark the dates that I did the exercise on the calendar!
        // todo: this
        formatter.dateFormat = "dd"
        let todaysDate = formatter.string(from: Date())
        let cellStateDate = formatter.string(from: cellState.date)

        formatter.dateFormat = "MMMM"
        let todaysMonth = formatter.string(from: Date())
        let cellStateMonth = formatter.string(from: cellState.date)

        // first mark today's date & month
        if ((todaysDate == cellStateDate) && (todaysMonth == cellStateMonth)){
            validCell.selectedView.backgroundColor = UIColor(colorWithHexValue: 0xfe4a49)
            validCell.selectedView.isHidden = false
        }
        
    }// end func
    
    func queryExerciseDate(date: Date) {
        
        do {
            // massage fetch request
            let fetchreq = NSFetchRequest<NSFetchRequestResult>(entityName:"ExerciseRecord")
            
            formatter.dateFormat = "MMM dd,yyyy"
            let day = formatter.string(from: date)
            
            fetchreq.predicate = NSPredicate(format: "day = %@", "\(day)")
            fetchreq.fetchLimit = 1
 
            // now query core data for details of my last workout
            exerciseContainer += try  appDelegate.persistentContainer.viewContext.fetch(fetchreq) as! [ExerciseRecord]
            
        }// end do
        catch {
            print (error.localizedDescription)
        }// end catch
    }
    
    //function to mark exercise dates
    //see if there is a way to optimize this method for speed (we are querying 30 times everytime we render calendar)
    func colorExerciseDates(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else {return}

        exerciseContainer.removeAll()
        queryExerciseDate(date: cellState.date)
        
        // get the count
        let index = exerciseContainer.count
        if (index != 0) {
            // found an entry, I've done this exercise before
            formatter.dateFormat = "yyyy MM dd"
            let lastDate = formatter.string(from: exerciseContainer[index-1].date!)
            let thisCellDate = formatter.string(from: cellState.date)
            if (lastDate == thisCellDate) {
                // paint the cells when I did exercise
                validCell.selectedView.backgroundColor = UIColor(colorWithHexValue: 0x83d0c9)
                validCell.selectedView.isHidden = false
            }
        }// endif
            
    }// end func colorExerciseDates
    
    
    @IBAction func resetTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Reset All Exercises", message: "This will reset all exercise records, are you sure?", preferredStyle: .alert)
        
        // Create OK button
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            self.cleanUpCoreData()
            print("Ok button tapped, all records purged");
        }
        alertController.addAction(OKAction)
        
        // Create Cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
            print("Cancel button tapped");
        }
        alertController.addAction(cancelAction)
        
        // Present Dialog message
        self.present(alertController, animated: true, completion:nil)
    }
    
    func cleanUpCoreData() {
        // create the delete request for the specified entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExerciseRecord")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        // get reference to the persistent container
        let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        
        // perform the delete
        do {
            try persistentContainer.viewContext.execute(deleteRequest)
        } catch let error as NSError {
            print(error)
        }
    }
    
}// end class


extension CalendarViewController: JTAppleCalendarViewDataSource {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        // this to start from the first day I started working out

        formatter.dateFormat = "yyyy"
        let startYear = formatter.string(from: Date())

        formatter.dateFormat = "MM"
        let startMonth = formatter.string(from: Date())
        
        // todo: change this to end 1 year from the first day I started working out
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: startYear + " " + startMonth + " 01")!
        let endDate = formatter.date(from: String(Int16(startYear)! + 1) + " " + startMonth + " 30")!

        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
}


extension CalendarViewController: JTAppleCalendarViewDelegate {
    // display the cell
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        cell.dataLabel.text = cellState.text
        
        //reset random cell markings
        resetRandomCellMarkings(view: cell, cellState: cellState)
        
        // handle text color of month dates and outside month dates
        handleCellTextColor(view: cell, cellState: cellState)
        
        // color exercise dates
        colorExerciseDates(view: cell, cellState: cellState)
        colorTodaysDate(view: cell, cellState: cellState)


        return cell
    }
    
    /*
    func calendar(_ calendar: JTAppleCalendarView, willScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        <#code#>
    }
     */
    
    // don't allow deselecting today's date
    func calendar(_ calendar: JTAppleCalendarView, shouldDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) -> Bool {
        let currentDateString = formatter.string(from: Date())
        let cellStateDateString = formatter.string(from: cellState.date)

        // disable de-selecting today's displayed date on calendar
        // todo: currenly only selecting date, need to select month too!
        if (currentDateString == cellStateDateString) {
            return false
        } else {
            return true
        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {

        handleCellSelected(view: cell, cellState: cellState)
        colorTodaysDate(view: cell, cellState: cellState)
    }
    
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        //handleCellDeselected(view: cell, cellState: cellState)
        colorTodaysDate(view: cell, cellState: cellState)
    }
    
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        updateMonthOfCalendarOnScroll(from: visibleDates)
    }
}// end extension


extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0) {
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16)/255.0,
            green: CGFloat((value & 0x00FF00) >> 8)/255.0,
            blue: CGFloat(value & 0x0000FF)/255.0,
            alpha:alpha
        )
    }
}// end extension
