//
//  ViewController.swift
//  app
//
//  Created by Elizabeth Song on 8/7/19.
//  Copyright © 2019 elizabeth. All rights reserved.
//

import UIKit
var pointValue : [String: Int] = [:]


class ViewController: UIViewController {
    
    var currentAuthor = ""
    //array will store the keys from the Dict
    var quotes : [String] = []
    //var pointValue : [String: Int] = [:]
    //make dict to define these words
//    var tweetDict = [
//        "text1": "person1",
//        "text2": "person2",
//        "text3": "person3"
//    ]
    var tweetDict = [
        "Mass pardon to those imprisoned for nonviolent marijuana offenses.": "Andrew Yang",
        "Censor the Internet executive order that would give powerful federal agencies far-reaching powers to pick and choose which kind of Internet material is and is not acceptable.": "Donald Trump",
        "If Israel wants to ban members of Congress, it should not receive billions in US Military Aid.": "Bernie Sanders",
        "Donald Trump is an Idiot.": "Bernie Sanders",
        "Mueller should not be allowed to tell Congress about his obstruction; it will be bad for him.": "Donald Trump",
        //"": "",
        "Reality TV show-styled elections resulted in Trump's election; we need to be more laser focused.": "Andrew Yang",
        "Legalize marijuana by Executive Order.": "Bernie Sanders",
        //nytimes article
        "I respect the desire of people to have a means of self-defense.": "Pete Buttigieg",
        "Talking about a future where no one owns a handgun is, frankly, not going to match up with reality.": "Andrew Yang",
        "I am not for messing with the Bill of Rights.": "Marianne Williamson",
        "Study after study shows that having a handgun, in most cases, makes you less safe, not more.": "John Hickenlooper",
        "Global climate change should be a moon shot for this generation.": "Kristen Gillibrand",
        "It’s not going to be one person in one office — it has to be a movement, a renewed commitment in our country and across this planet.": "Cory Booker",
        "One president can’t do it alone, but one president can set the direction for the country.": "Steve Bullock",
        "We need to make massive investments in renewable energy and in bringing down carbon emissions.": "Julian Castro",
        "About tech giants, You can be the umpire – that is, you can run the platform, the marketplace – or you can have a team in the game – that is, you can be one of the competing businesses. But you don’t get to do both.": "Elizabeth Warren",
        "I think the antitrust division of the Department of Justice could be better used against tech giants.": "Eric Swalwell",
        "We need to scrutinize more these kinds of companies and potential mergers, whether they are in the tech industry, the telecom industry, agribusiness.": "Julian Castro",
        "I want a baby-bond, a trust fond for every American child seeded by the federal government that could eventually provide up to nearly $50,000 for college tuition, buying a home or starting a business.": "Cory Booker",
        "Rural communities are brimming with possibilities, and places like Tipton and Burlington can lead the way in helping to meet America's challenges.": "Pete Buttigieg",
        "84 years ago today, we recognized that when we care for seniors and Americans who've lost their jobs, it provides all of us with greater security. As President, I’ll protect Social Security—not just as a lifeline for millions but as a national inheritance for future generations.": "Pete Buttigieg",
        "Empower federal courts to issue new “Domestic Terrorism Prevention Orders” to temporarily seize the gun of a suspected terrorist or individual who may imminently perpetrate a hate crime.": "Kamala Harris",
        "The Trump tax scam was never about helping the American people, it was a massive giveaway to corporations and the wealthy.": "Kamala Harris",
        "Parents shouldn’t have to sit their children down and warn them that they might be a target because of the color of their skin.": "Kamala Harris",
        "Do the math: At the most, the Wall will cost $20 billion. Illegals cost US taxpayers $165 billion a year": "Donald Trump",
        "The Democrats and President Obama gave Iran 150 Billion Dollars and got nothing, but they can’t give 5 Billion Dollars for National Security and a Wall?": "Donald Trump"

    ]
//    var tweetDict = [
//        "person1": "text1",
//        "person2": "text2",
//        "person3": "text3",
//        "person4": "text4"
//    ]
    //starts at 0 to display first index
    var counter = 0
    
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        quoteLabel.numberOfLines = 0 // or 1
        
        quoteLabel.sizeToFit()
        quoteLabel.lineBreakMode = .byWordWrapping
//        quoteLabel.adjustsFontSizeToFitWidth = true
//        quoteLabel.minimumScaleFactor = 0.2
        //fill in quotes array and pointValue dictionary
        
        //add one filler for the beginning
//        quotes.append("")
        for (quote,author) in tweetDict{
            //quoteLabel.text = quote
            quotes.append(quote)
            pointValue[author] = 0
            //print(author)
        }
//        print(quotes)
//        print(pointValue)
        print("Label should be: \(quotes[0])")
        quoteLabel.text = quotes[0]
//        print("Count: \(counter) and \(quotes[counter])") //just checking
        
        
        print("\(tweetDict[quotes[counter]]) is the person who is tweeting.")
        
        
        //author is retrieved from tweetDict[quotes[counter]]
        //quotes[counter] = the current tweet that we have

        //now we access this person's value using his name as a key from dict
        currentAuthor = tweetDict[quotes[counter]]!
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func homeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //liking the tweet
    @IBAction func swipeRight(_ sender: Any) {
        pointValue[currentAuthor] = pointValue[currentAuthor]! + 1
        print("\(currentAuthor) now has \(pointValue[currentAuthor]) points.")
        //finished all the quotes
        if counter >= quotes.count - 1{
            performSegue(withIdentifier: "endingGame", sender: self)
            
            quoteLabel.text = quotes[quotes.count-1]
            print(pointValue)
        }
        //still have not finished all quotes
        else{
            //need to increase by 1 for the author the tweet is by
            //author is retrieved from tweetDict[quotes[counter]]
            //quotes[counter] = the current tweet that we have
            
            //now we access this person's value using his name as a key from dict
            
            counter += 1
            quoteLabel.text = quotes[counter]
//            print("Count: \(counter) and \(quotes[counter])") //just checking
            
            //same as in ViewDidLoad
            print("\(tweetDict[quotes[counter]]) is the person who is tweeting.")
            
            currentAuthor = tweetDict[quotes[counter]]!
            

            
        }
        
    }
    
    //disliking the tweet
    @IBAction func swipeLeft(_ sender: Any) {
        pointValue[currentAuthor] = pointValue[currentAuthor]! - 1
        print("\(currentAuthor) now has \(pointValue[currentAuthor]) points.")
        //finished all the quotes
        if counter >= quotes.count - 1{
            performSegue(withIdentifier: "endingGame", sender: self)
            
            quoteLabel.text = quotes[quotes.count-1]
            print(pointValue)
        }
            //still have not finished all quotes
        else{
            //need to decrease by 1 for the author the tweet is by
            //author is retrieved from tweetDict[quotes[counter]]
            //quotes[counter] = the current tweet that we have
            
            //now we access this person's value using his name as a key from dict
            
            
            counter += 1
            quoteLabel.text = quotes[counter]
//            print("Count: \(counter) and \(quotes[counter])") //just checking
            
            //same as in ViewDidLoad
            print("\(tweetDict[quotes[counter]]) is the person who is tweeting.")
            
            currentAuthor = tweetDict[quotes[counter]]!
            
            
            
        }
    }
    
}

