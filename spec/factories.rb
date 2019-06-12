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

  factory :king, class: Piece do
    factory :white_king do
      color {"white"}
    end

    factory :black_king do  
      color {"black"}
    end
  end

  factory :queen, class: Piece do
    factory :white_queen do
      color {"white"}
    end

    factory :black_queen do  
      color {"black"}
    end
  end

  factory :rook, class: Piece do
    factory :white_rook do
      color {"white"}
    end

    factory :black_rook, class: Piece do  
      color {"black"}
    end
  end

  factory :bishop, class: Piece do
    factory :white_bishop do
      color {"white"}
      sequence :id do |n|
        "#{n}"
      end
    end

    factory :black_bishop do  
      color {"black"}
      sequence :id do |n|
        "#{n}"
      end
    end
  end

  factory :pawn, class: Piece do
    factory :white_pawn do
      color {"white"}
    end

    factory :black_pawn do  
      color {"black"}
    end
  end

  factory :knight, class: Piece do
    factory :white_knight do
      color {"white"}
    end

    factory :black_knight do  
      color {"black"}
    end
  end
end



