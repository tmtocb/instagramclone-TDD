FactoryBot.define do
  factory :post do
    description { Faker::Internet.email }
    user_id { 1 }
    image { Rack::Test::UploadedFile.new('spec/factories/test.png', 'image/png') }
  end
end