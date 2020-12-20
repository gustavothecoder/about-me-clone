# frozen_string_literal: true

puts 'Populating the reasons table...'

[
  ['Attend my event', 'event'],
  ['Back my campaign', 'campaign page'],
  ['Download my app', 'app'],
  ['Hire me', 'resume or portfolio'],
  ['Listen to my music', 'music or playlists'],
  ['Listen to my podcast', 'podcast'],
  ['Read my articles', 'articles'],
  ['Read my blog', 'blog'],
  ['Read my book', 'book'],
  ['Schedule an appointment', nil],
  ['Visit my store', 'online store'],
  ['Sign up for my newsletter', 'newsletter form'],
  ['Stay at my place', 'rental property'],
  ['Support my charity', 'favorite charity'],
  ['Take my class', 'class or course'],
  ['Try my food', 'recipe'],
  ['Visit my company website', 'company website'],
  ['View my listings', 'listings'],
  ['View my photos', 'photos'],
  ['View my portfolio', 'portfolio'],
  ['Watch my reel', 'reel'],
  ['View my repo', 'repo'],
  ['Visit my restaurant', 'restaurant'],
  ['Visit my website', 'website'],
  ['Watch my videos', 'videos'],
  ['Work out with me', 'fitness profile'],
  ['Vote now', 'awareness page'],
  ['Register to vote', 'registration website'],
  ['Support my candidate', "candidate's website"]
].each { |reason| Reason.create(reason: reason[0], keywords: reason[1]) }
