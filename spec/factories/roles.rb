FactoryBot.define do
  factory :role do
    name {"user"}

    factory :author do
      sequence(:name) { "author" }
    end
    factory :admin do
      sequence(:name) { "admin" }
    end
    factory :guest do
      sequence(:name) { "guest" }
    end
  end
end
