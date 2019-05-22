FactoryBot.define do

  factory :user do
    sequence :email do |n|
       "dummyEmail#{n}@gmail.com" 
    end
    password {"secretPassword"}
    password_confirmation {"secretPassword" }
  end

  factory :game do
    sequence :game_id do |n|
      "#{n}"
    end
  end

  factory :player do
  end

  factory :piece do
  end

end

