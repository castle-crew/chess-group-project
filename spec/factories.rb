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
    trait :white_piece do
      color {"white"}
    end

    trait :black_piece do
      color {"black"}
    end
  end

  factory :King do
    trait :white_king do
      color {"white"}
    end

    trait :black_king do
      color {"black"}
    end
  end

  factory :Queen do
    trait :white_queen do
      color {"white"}
    end

    trait :black_queen do
      color {"black"}
    end
  end

  factory :Rook do
    trait :white_rook do
      color {"white"}
    end

    trait :black_rook do
      color {"black"}
    end
  end

  factory :Bishop do
    trait :white_bishop do
      color {"white"}
    end

    trait :black_bishop do
      color {"black"}
    end
  end

  factory :Pawn do
    trait :white_pawn do
      color {"white"}
    end

    trait :black_pawn do
      color {"black"}
    end
  end

  factory :Knight do
    trait :white_knight do
      color {"white"}
    end

    trait :black_knight do
      color {"black"}
    end
  end
end

