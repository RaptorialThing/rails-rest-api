FactoryBot.define do
  factory :user do
     username {"nomad"}
     email {"nomad@nomad.com"}
     password {"nomad"}
     jti {SecureRandom.uuid}
  end
end
