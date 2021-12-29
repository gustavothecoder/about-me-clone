# Frozen_string_literal: true

puts 'Creating the examples...'

luis_photo = File.binread(Rails.root.join('spec', 'fixtures', 'luis_gama.jpg'))
andre_photo = File.binread(Rails.root.join('spec', 'fixtures', 'andre_reboucas.jpg'))
jose_photo = File.binread(Rails.root.join('spec', 'fixtures', 'jose_do_patrocinio.jpg'))
angela_photo = File.binread(Rails.root.join('spec', 'fixtures', 'angela_davis.jpg'))

[
  {
    email: 'luis.gama@email.com',
    first_name: 'Luís',
    last_name: 'Gama',
    location: 'Brazil',
    user_interests: '8,12,29',
    user_occupations: '11',
    user_reason: '7',
    website: 'https://en.wikipedia.org/wiki/Lu%C3%ADs_Gama',
    photo: "data:image;base64,#{Base64.strict_encode64(luis_photo)}",
    layout: 0,
    color: 0,
    username: 'luis_gama',
    password: '123456a',
    password_confirmation: '123456a'
  },
  {
    email: 'andre.reboucas@email.com',
    first_name: 'André',
    last_name: 'Rebouças',
    location: 'Brazil',
    user_interests: '8,20,29',
    user_occupations: '9',
    user_reason: '7',
    website: 'https://en.wikipedia.org/wiki/Andr%C3%A9_Rebou%C3%A7as',
    photo: "data:image;base64,#{Base64.strict_encode64(andre_photo)}",
    layout: 1,
    color: 1,
    username: 'andre_reboucas',
    password: '123456a',
    password_confirmation: '123456a'
  },
  {
    email: 'jose.do.patrocinio@email.com',
    first_name: 'José',
    last_name: 'Do Patrocínio',
    location: 'Brazil',
    user_interests: '8,12,29',
    user_occupations: '11',
    user_reason: '7',
    website: 'https://en.wikipedia.org/wiki/Jos%C3%A9_do_Patroc%C3%ADnio',
    photo: "data:image;base64,#{Base64.strict_encode64(jose_photo)}",
    layout: 2,
    color: 2,
    username: 'jose_do_patrocinio',
    password: '123456a',
    password_confirmation: '123456a'
  },
  {
    email: 'angela.davis@email.com',
    first_name: 'Angela',
    last_name: 'Davis',
    location: 'U.S.',
    user_interests: '12,16,20,21,29',
    user_occupations: '10,11',
    user_reason: '7',
    website: 'https://en.wikipedia.org/wiki/Angela_Davis',
    photo: "data:image;base64,#{Base64.strict_encode64(angela_photo)}",
    layout: 0,
    color: 3,
    username: 'angela_davis',
    password: '123456a',
    password_confirmation: '123456a'
  }
].each { |params| Users::Create.call(params) }
