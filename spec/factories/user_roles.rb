FactoryBot.define do
  factory :user_role do
    user_id {create(:user).id}
    role_id {create(:author).id}

    factory :user_author do
      sequence(:user_id) { create(:author).id }
    end
  end
end
