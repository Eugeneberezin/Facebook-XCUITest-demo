//
//  Facebook_XCUITest_demoUITests.swift
//  Facebook-XCUITest-demoUITests
//
//  Created by Eugene Berezin on 6/8/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import XCTest

class Facebook_XCUITest_demoUITests: XCTestCase {
    
      let facebookApp = XCUIApplication(bundleIdentifier: "com.facebook.Facebook")

    override func setUp() {
        
        continueAfterFailure = false
        facebookApp.launch()

    }

    override func tearDown() {
       facebookApp.terminate()
    }

    func testfaceBookRegistration() {
        
        //TODO: Create page object model and refactor the code
        
        facebookApp.launch()
        let createAccount = facebookApp .buttons["sign-up-button"]
        let getStartedButton = facebookApp.buttons["get-started-button-welcome"]
        let firstNameTextFiled = facebookApp.scrollViews.otherElements.textFields["first-name-field"]
        let lastNameTextField = facebookApp.scrollViews.otherElements.textFields["last-name-field"]
        let maleGender = facebookApp.scrollViews.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element
        let nextButton =  facebookApp.buttons["Next"]
        let registerByEmailButton = facebookApp.buttons["change-contact-point-type-button"]
        let emailTextField = facebookApp.scrollViews.otherElements.textFields["contact-point-email-field"]
        let goButton = facebookApp.buttons["Go"]
        let passwordTextField = facebookApp.scrollViews.otherElements.textFields["password-field"]
        let signUp = facebookApp.buttons["get-started-button"]
        let logOutButton = facebookApp.navigationBars["Confirm Your Account"].buttons["Log out"]
        
        
        
        func pickARandomDate(){
            _ = facebookApp.datePickers.pickerWheels.element(boundBy: 2).swipeDown()
            facebookApp.toolbars["input-accessory-view"].buttons["Continue"].tap()
        }
        
        func generateUniqueEmail() -> String {
            let time = Date().timeIntervalSinceReferenceDate
            let email = "awesometester+\(time)@mailsack.com"
            return email
        }
        
        createAccount.tap()
        getStartedButton.tap()
        firstNameTextFiled.typeText("Awes")
        lastNameTextField.tap()
        lastNameTextField.typeText("Tes")
        goButton.tap()
        pickARandomDate()
        maleGender.tap()
        nextButton.tap()
        registerByEmailButton.tap()
        emailTextField.tap()
        emailTextField.typeText(generateUniqueEmail())
        goButton.tap()
        passwordTextField.tap()
        passwordTextField.typeText("PasswordIsAwesome123!")
        goButton.tap()
        
        signUp.tap()
        
        guard logOutButton.waitForExistence(timeout: 5) else {
            XCTFail("Fail")
            return
        }
        
        XCTAssert(logOutButton.exists, "Log out button is not visible")
        
        logOutButton.tap()
        
        facebookApp.otherElements.staticTexts["Save and Log Out"].tap()
        
       
        
    }

}
