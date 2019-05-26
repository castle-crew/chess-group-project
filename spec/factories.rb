FactoryBot.define do

  factory :user do
    sequence :email do |n|
       "dummyEmail#{n}@gmail.com" 
    end
    password {"secretPassword"}
    password_confirmation {"secretPassword" }
  end

  factory :Game do
    sequence :game_id do |n|
      "#{n}"
    end
  end

  factory :player do
  end

  factory :piece do
  end

  # factory :King do
  #   color { ["white", "black"].sample}
  # end
  factory :King do
    trait :white_king do
      color {"white"}
    end

    trait :black_king do
      color {"black"}
    end
  end

  factory :Queen do
  end

  factory :Rook do
  end

  factory :Bishop do
  end

  factory :Pawn do
  end

  factory :Knight do
  end
end

