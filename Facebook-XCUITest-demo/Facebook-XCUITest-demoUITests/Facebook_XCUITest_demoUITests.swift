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
        
        facebookApp.launch()
        let createAccount = facebookApp /*@START_MENU_TOKEN@*/.buttons["sign-up-button"]/*[[".otherElements[\"login-main\"].buttons[\"sign-up-button\"]",".buttons[\"sign-up-button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let getStartedButton = facebookApp/*@START_MENU_TOKEN@*/.buttons["get-started-button-welcome"]/*[[".scrollViews",".buttons[\"Get Started\"]",".buttons[\"get-started-button-welcome\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        let firstNameTextFiled = facebookApp.scrollViews.otherElements/*@START_MENU_TOKEN@*/.textFields["first-name-field"]/*[[".textFields[\"First name\"]",".textFields[\"first-name-field\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let lastNameTextField = facebookApp.scrollViews.otherElements/*@START_MENU_TOKEN@*/.textFields["last-name-field"]/*[[".textFields[\"Last name\"]",".textFields[\"last-name-field\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let maleGender = facebookApp.scrollViews.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element
        let nextButton =  facebookApp/*@START_MENU_TOKEN@*/.buttons["Next"]/*[[".scrollViews.buttons[\"Next\"]",".buttons[\"Next\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let registerByEmailButton = facebookApp/*@START_MENU_TOKEN@*/.buttons["change-contact-point-type-button"]/*[[".scrollViews",".buttons[\"Use your email address\"]",".buttons[\"change-contact-point-type-button\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        let emailTextField = facebookApp.scrollViews.otherElements/*@START_MENU_TOKEN@*/.textFields["contact-point-email-field"]/*[[".textFields[\"Enter your email address\"]",".textFields[\"contact-point-email-field\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let goButton = facebookApp.buttons["Go"]
        let passwordTextField = facebookApp.scrollViews.otherElements/*@START_MENU_TOKEN@*/.textFields["password-field"]/*[[".textFields[\"Password\"]",".textFields[\"password-field\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let signUp = facebookApp/*@START_MENU_TOKEN@*/.buttons["get-started-button"]/*[[".scrollViews",".buttons[\"Sign Up\"]",".buttons[\"get-started-button\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
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
