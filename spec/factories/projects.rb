FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description { "A test project." }
    due_on { 1.week.from_now }
    association :owner # owner ???
  end

  # 関連付けられた notes の生成 traitのコールバック利用
  trait :with_notes do
    after(:create) { |project| create_list(:note, 5, project: project) }
  end

  # 締切が昨日 traitの利用
  trait :due_yesterday do
    due_on { 1.day.ago }
  end

  # 締切が今日 traitの利用
  trait :due_today do
    due_on { Date.current.in_time_zone }
  end

  # 締切が明日 traitの利用
  trait :due_tomorrow do
    due_on { 1.day.from_now }
  end
end
