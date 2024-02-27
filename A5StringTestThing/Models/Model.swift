//
//  Model.swift
//  A5StringTestThing
//
//  Created by Carver Wambold24 on 2/13/24.
//

import Foundation
let keywords : [String] = ["alert","inspired","determined","attentive","active","afraid","nervous","upset","guilty","hostile","enthusiastic","proud","strong","scared","irritable","ashamed","interested","distressed","excited","jittery","vigilant","ashamed","inspired","nervous","determined","attentive","jittery","active","afraid","proud","happy","content","joyful","excited","grateful","stressed","anxious","calm","overwhelmed","relaxed","sad","melancholy","hopeful","despair","frustrated","satisfied","bored","curious","insecure","confident","angry","annoyed","apathetic","motivated","discouraged","elated","gloomy","inspired","lonely","connected","tired","amazing", "wonders", "worst","terrible","Incredible","Marvelous","Disastrous","Horrific","Exceptional","Delightful","Catastrophic","Appalling","Exhilarating","Pleasant","Unpleasant","Depressing","Satisfying","Frustrating","Joyous","Troubling","Blissful","Annoying","Enthralling","Dreadful","Inspiring","Distressing","Thrilling","Displeasing","Heartwarming","Alarming","Dope","Epic","Trash","Woke","Cancelled","Goat","Legit","Ratchet","Squad goals","Trolled","Winning","Fail","Glow up","Hater","On point","Overrated","Slept on","Stoked","Try-hard","Whack","Dank","Clapped","Fire","Litty","Shady","Boujee","Poppin'","Canceled","Cheugy","Stan","Toxic","Bomb","Cringey","Lit","Meh","Chill","Hyped","Cringe","Ghosted","Salty","Vibing","Lame","Basic","Thirsty","Slay","Fire","Snatched","FOMO","Gucci","Sus","Bussin","Bet","Radical","Gnarly","Bogus","Groovy","Wicked","Lame","Fly","Phat","Bummer","Chill","Square","Psyched","Stoked","Dweeb","Tight","Fresh","Cheesy","Slick","Beat","Copacetic","Hella","Busted","Slammin'","Radical","Tubular","Spaz","Trippin'","Cancelled","Sleepy","Tired","Intrigued","Curious","Bored","Relaxed","Energized","Drained","Interested","Indifferent","Focused","Distracted","Excited","Apathetic", "great", "bad", "good"]
    
let values : [Int] = [3,4,4,3,3,-4,-4,-5,-3,-5,5,4,4,-4,-4,-3,4,-5,5,-4,3,-4,5,-4,4,3,-3,3,-5,4,5,4,5,4,3,-4,-5,3,-4,4,-5,-3,4,-5,-4,3,-2,3,-4,5,-5,-3,-3,4,-4,5,-4,5,-5,4,-2, 5, 4, -5, -4, 5, 4, -5, -4, 5, 4,-5,-4,5,3,-3,-5,3,-3,5,-3,5,-2,4,-5,4,-4,5,-2,4,-3,3,3,-3,2,-3,3,2,-2,3,-3,3,-3,3,-2,3,-2,2,3,-2,-3,2,-3,3,3,-2,-1,3,-3,-2,3,-3,3,-3,3,0,2,3,-3,-4,-2,2,-3,-2,-2,3,3,2,-3,2,-2,3,1,3,2,-3,3,3,-3,3,2,-2,2,-2,3,3,-2,2,2,-2,2,-2,2,2,-3,3,3,3,-2,-1,-3,0,-1,2,2,-2,2,3,-3,2,0,2,-2,3,-2,3, -3, 2]


struct Word {
    let keyword: String
    let value: Int
}
