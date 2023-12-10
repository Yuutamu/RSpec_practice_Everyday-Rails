FactoryBot.define do
  factory :user, aliases: [:owner] do # aliases: [:owner] と記述
    first_name { "Aaron" }
    last_name  { "Sumner" }
    sequence(:email) { |n| "tester#{n}@example.com" } # シークエンス
    password { "dottle-nouveau-pavilion-tights-furze" }
  end
end
