FactoryBot.define do
  factory :board do
    
  end

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

end

