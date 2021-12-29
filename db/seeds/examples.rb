# Frozen_string_literal: true

puts 'Creating the examples...'

luis_photo = Rack::Test::UploadedFile.new('spec/fixtures/luis_gama.jpg')
andre_photo = Rack::Test::UploadedFile.new('spec/fixtures/andre_reboucas.jpg')
jose_photo = Rack::Test::UploadedFile.new('spec/fixtures/jose_do_patrocinio.jpg')
angela_photo = Rack::Test::UploadedFile.new('spec/fixtures/angela_davis.jpg')

def create_photo_blob(photo:)
  ActiveStorage::Blob.create_and_upload!(
    io: photo,
    filename: photo.original_filename,
    content_type: photo.content_type,
    identify: false
  ).signed_id
end

[
  {
    'email' => 'luis.gama@email.com',
    'first_name' => 'Luís',
    'last_name' => 'Gama',
    'location' => 'Brazil',
    'interests' => %w[8 12 29],
    'occupations' => %w[11],
    'reason' => %w[7],
    'website' => 'https://en.wikipedia.org/wiki/Lu%C3%ADs_Gama',
    'photo_signed_id' => create_photo_blob(photo: luis_photo),
    'layout' => '0',
    'color' => '0',
    'username' => 'luis_gama',
    'password' => '123456a',
    'password_confirmation' => '123456a'
  },
  {
    'email' => 'andre.reboucas@email.com',
    'first_name' => 'André',
    'last_name' => 'Rebouças',
    'location' => 'Brazil',
    'interests' => %w[8 10 29],
    'occupations' => %w[9],
    'reason' => %w[7],
    'website' => 'https://en.wikipedia.org/wiki/Andr%C3%A9_Rebou%C3%A7as',
    'photo_signed_id' => create_photo_blob(photo: andre_photo),
    'layout' => '1',
    'color' => '1',
    'username' => 'andre_reboucas',
    'password' => '123456a',
    'password_confirmation' => '123456a'
  },
  {
    'email' => 'jose.do.patrocinio@email.com',
    'first_name' => 'José',
    'last_name' => 'Do Patrocínio',
    'location' => 'Brazil',
    'interests' => %w[8 12 29],
    'occupations' => %w[11],
    'reason' => %w[7],
    'website' => 'https://en.wikipedia.org/wiki/Jos%C3%A9_do_Patroc%C3%ADnio',
    'photo_signed_id' => create_photo_blob(photo: jose_photo),
    'layout' => '2',
    'color' => '2',
    'username' => 'jose_do_patrocinio',
    'password' => '123456a',
    'password_confirmation' => '123456a'
  },
  {
    'email' => 'angela.davis@email.com',
    'first_name' => 'Angela',
    'last_name' => 'Davis',
    'location' => 'U.S.',
    'interests' => %w[12 16 20 21 29],
    'occupations' => %w[10 11],
    'reason' => %w[7],
    'website' => 'https://en.wikipedia.org/wiki/Angela_Davis',
    'photo_signed_id' => create_photo_blob(photo: angela_photo),
    'layout' => '0',
    'color' => '3',
    'username' => 'angela_davis',
    'password' => '123456a',
    'password_confirmation' => '123456a'
  }
].each { |params| Users::Create.call(params) }
