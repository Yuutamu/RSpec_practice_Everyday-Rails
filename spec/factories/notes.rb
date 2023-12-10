FactoryBot.define do
  factory :note do
    message { "My important note." }
    association :project
    # association :user # この記述だとユーザーが二人以上作成されてしまう
    user { project.owner} # owner と記述する factorybotの難しさ。 P69 inspectメソッドで調べる方法便利だな。
  end
end
