//
//  Utils.swift
//  GogginsMotivation
//
//  Created by Martynas Brazionis on 2022-04-04.
//

import Foundation

class Util {
    public static func getPhrasesData() -> [PhraseData] {
        let withCurses = false
        let fucking: String
        let shit: String
        let fuck: String
        let mofo: String

        if (withCurses) {
            fucking = "fucking"
            shit = "shit"
            fuck = "fuck"
            mofo = "motherfucker"
        } else {
            fucking = "f-ing"
            shit = "sh"
            fuck = "f"
            mofo = "mfer"
        }
        var array = [PhraseData]()
        array.append( PhraseData(
            soundRes: "always_have_haters_embrace",
            soundText: "One thing in life, you are gonna always have haters. Embrace them."
        ))
        array.append( PhraseData(
            soundRes: "bcs_it_sucks_merry_christmas",
            soundText: "Pain is just a feeling. You see this happiness? \nWhy, because it sucks. That's why I'm so happy right now. Merry Christmas."
        ))
        array.append( PhraseData(
            soundRes: "at_the_bottom_was_me",
            soundText: "At the bottom of insecurities, fear, self doubt, lies, was me burried in a \(fucking) fear position."
        ))
     
        array.append( PhraseData(
            soundRes: "be_who_the_f_u_are",
            soundText: "Don't worry about that \(shit), be unapologetic,\n get after it, stay hard, be what the \(fuck) you are."
        ))
        array.append( PhraseData(
            soundRes: "be_mvp",
            soundText: "Be the \(fucking) MVP!"
        ))
        array.append( PhraseData(
            soundRes: "be_better_doctor",
            soundText: "It's not enough you became a doctor. Be a better doctor!"
        ))
        array.append( PhraseData(
            soundRes: "be_in_love_w_yourself_face_different",
            soundText: "Be in love with yourself. Write that \(shit) down. Start to face these different things in life."
        ))
     
        array.append( PhraseData(
            soundRes: "do_it_do_it_crazy",
            soundText:  "Before you say something's impossible," +
            " do it and do it to a level that people think that you might be \(fucking) crazy"
        ))
        array.append( PhraseData(
            soundRes: "cannot_fix_until_fix_urself",
            soundText: "You cannot fix anything in life until you fix yourself"
        ))
        array.append( PhraseData(
            soundRes: "big_race_more_miles",
            soundText: "If you training for a nice big race," +
            " get your legs all tired, mugged up, jacked up," +
            " when your mind and body says you don't want to \(fucking) do \(shit) anymore." +
            " And guess what you do, you get up and get some more miles in"
        ))
     
        array.append( PhraseData(
            soundRes: "get_out_there_triple_down_on_weakness",
            soundText: "Do something every day that sucks. Get outside your" +
            " comfort zone. Triple down on your weaknesses."
        ))
        array.append( PhraseData(
            soundRes: "fragile_die_w_meaning",
            soundText:  "We are all very fragile in" +
            " this world. We have to know when we die, we die with some meaning"
        ))
        array.append( PhraseData(
            soundRes: "find_throw_towel_back",
            soundText: "A lot of us can't do thing on their own." +
            " So find somebody in your life so when you throw that towel in, they throw that \(mofo) back at you and say you are not \(fucking)" +
            " done yet. Stay true to yourself, stay hard."
        ))
        array.append( PhraseData(
            soundRes: "find_best_self_when_least_motivated",
            soundText: "You have to find your best self when you are the least motivated"
        ))
        array.append( PhraseData(
            soundRes: "figure_out_yourselft",
            soundText: "Figure out yourself, get yourself hard, stay hard."
        ))
        array.append( PhraseData(
            soundRes: "equal_playing_field_get_in_the_game",
            soundText: "We got to get on an equal playing field, find a way to get" +
            " in an equal playing field with somebody. Get in the game!"
        ))
        array.append( PhraseData(
            soundRes: "dont_have_quiting_mind",
            soundText: "Don't have a \(fucking) quitting mind, repetition every day, stay hard!"
        ))
        array.append( PhraseData(
            soundRes: "do_smth_everyday_that_suck",
            soundText: "Do something every day that sucks"
        ))
        
        array.append( PhraseData(
            soundRes: "if_u_lose_life_in_head",
            soundText: "If you lose, it's because you allow life to get in your \(fucking) head"
        ))
        array.append( PhraseData(
            soundRes: "healthy_body_healthy_mind",
            soundText: "A healthy body use your healthy mind"
        ))
        array.append( PhraseData(
            soundRes: "hungry_not_civilised",
            soundText: "It's important to always stay hungry and never get too civilized"
        ))
        array.append( PhraseData(
            soundRes: "hate_get_better_like_same",
            soundText: "I'd rather you hate me and get better, than like me and stay the same!"
        ))
        array.append( PhraseData(
            soundRes: "good_way_hit_the_gym",
            soundText: "A good way to build that" +
            " \(fucking) self esteem up is get to the gym and change the way you look."
        ))
        array.append( PhraseData(
            soundRes: "get_to_the_source_and_fix_prob",
            soundText: "We like to live in social media," +
            " with lies about ourselves, how great we are. Get to the source and fix the problem!"
        ))
  
        array.append( PhraseData(
            soundRes: "learn_brain_like_brain_learned_you",
            soundText: "You got to learn your brain, like the brain has learned you"
        ))
        array.append( PhraseData(
            soundRes: "judgeing_problems_themselves",
            soundText: "Everybody else out there," +
            " everybody judging you, they also have problems themselves"
        ))
        
        array.append( PhraseData(
            soundRes: "internal_motivation",
            soundText: "What do you do, when you gave to external motivation? It's about the internal."
        ))
        array.append( PhraseData(
            soundRes: "if_u_lose_life_in_head",
            soundText: "If you lose, it's because you allow life to get in your \(fucking) head"
        ))
       
        array.append( PhraseData(
            soundRes: "one_finish_death",
            soundText: "There's only one finish line in life. " +
            "And that is death."
        ))
        array.append( PhraseData(
            soundRes: "one_day_but_not_today",
            soundText: "How about days off? One day but not today."
        ))
       
        array.append( PhraseData(
            soundRes: "not_enough_50pounds",
            soundText: "It's not enough you lost 50 pounds, got out there and" +
            " do something with it!"
        ))
        array.append( PhraseData(
            soundRes: "lifes_hate_game_play_w_urself",
            soundText:   "Life is one big \(fucking) hate game. You're playing with yourself!"
        ))
       
        array.append( PhraseData(
            soundRes: "life_brutal_love_about_it",
            soundText:  "Life is the most brutal endurance sport" +
            " of all time. And that's what we have to love about it"
        ))
        
        array.append( PhraseData(
            soundRes: "space_in_your_head_losing",
            soundText: "If you are allowing people, things and situations " +
            "to own space in your \(fucking) head, you are losing."
        ))
        array.append( PhraseData(
            soundRes: "shut_the_fcking_noise_out",
            soundText: "Learn one thing. Shut the \(fucking) noise out!"
        ))
       
        array.append( PhraseData(
            soundRes: "show_up_everyday",
            soundText:  "You have to have the mentality to show up every day in your life." +
            " No matter what life throws at you."
        ))
        array.append( PhraseData(
            soundRes: "positive_self_talk_doesnt_work",
            soundText:     "Positive self talk doesn't work unless you put the work behind it." +
            " It's only bullshit. Put the work behind your positive self talk."
        ))
       
        array.append( PhraseData(
            soundRes: "people_questioning_who_you_are",
            soundText: "That's exactly where you need to \(fucking) be" +
            " in your life with those people who put you in the world of questioning who you are."
        ))
        array.append( PhraseData(
            soundRes: "people_dont_like_you_doing_right",
            soundText:     "Embrace the fact that people don't like you." +
            " It means you're doing something right."
        ))
       
        array.append( PhraseData(
            soundRes: "the_grind_is_forever",
            soundText: "The grind is forever. There is no end. There" +
            " is no count down. As long" + " as you're breathing, you have to get trying to get better."
        ))
        array.append( PhraseData(
            soundRes: "the_best_place_isolation",
            soundText:  "The best place to make those dreams come true is isolation"
        ))
        array.append( PhraseData(
            soundRes: "stop_telin_urself_you_doin_enough",
            soundText: "You have to do more. You have to stop telling yourself" +
            " that you are doing enough"
        ))
        array.append( PhraseData(
            soundRes: "stop_hero_of_your_story",
            soundText: "Stop looking at me or other people out here to be" +
            " the hero of your story."
        ))
        array.append( PhraseData(
            soundRes: "stay_in_your_own_mind",
            soundText: "Stay in your own mind. Don't let them own yours."
        ))
        array.append( PhraseData(
            soundRes: "stay_hard",
            soundText: "Stay hard"
        ))
     
        array.append( PhraseData(
            soundRes: "whos_gonna_carry_the_boats",
            soundText: "Who's gonna carry the boats?!"
        ))
        array.append( PhraseData(
            soundRes: "you_dont_know_me_son",
            soundText: "You don't know me son!"
        ))
        array.append( PhraseData(
            soundRes: "when_u_were_younger_what_u_wannabe",
            soundText:   "Let me ask you a question. When you were younger" +
            " what did you want to be?"
        ))
        array.append( PhraseData(
            soundRes: "ture_growth_finding_yourself",
            soundText: "That's where true growth is. It's finding yourself."
        ))
        array.append( PhraseData(
            soundRes: "this_time_to_get_to_know_you_person",
            soundText:    "This is time for you right now in all that " +
            "solitude to get to know who you are as a person."
        ))
        return array
    }
}
