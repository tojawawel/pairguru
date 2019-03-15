FactoryBot.define do
  factory :comment do
    body "Taki to komentarz"
    user { FactoryBot.create(:user) }
    movie { FactoryBot.create(:movie) }
  end
end
