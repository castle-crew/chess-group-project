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
    factory :white_piece do
      color {"white"}
    end

    factory :black_piece do  
      color {"black"}
    end
  end

  factory :king do
    factory :white_king do
      color {"white"}
    end

    factory :black_king do  
      color {"black"}
    end
  end

  factory :queen do
    factory :white_queen do
      color {"white"}
    end

    factory :black_queen do  
      color {"black"}
    end
  end

  factory :rook do
    factory :white_rook do
      color {"white"}
    end

    factory :black_rook do  
      color {"black"}
    end
  end

  factory :bishop do
    factory :white_bishop do
      color {"white"}
    end

    factory :black_bishop do  
      color {"black"}
    end
  end

  factory :pawn do
    factory :white_pawn do
      color {"white"}
    end

    factory :black_pawn do  
      color {"black"}
    end
  end

  factory :knight do
    factory :white_knight do
      color {"white"}
    end

    factory :black_knight do  
      color {"black"}
    end
  end
end

