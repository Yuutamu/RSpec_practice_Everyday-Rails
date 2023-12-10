require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "プロジェクトのアソシエーションと重複の検証" do
    it "同一ユーザーのプロジェクト名の重複を許可しないこと" do
      user = User.create(
        first_name:  "Joe",
        last_name:  "Tester",
        email:      "tester@example.com",
        password:   "dottle-nouveau-pavilion-tights-furze",
      )
      user.projects.create(
        name: "TestProject",
      )

      new_user  = User.new(
        first_name:  "Joe",
        last_name:  "Tester",
        email:      "tester@example.com",
        password:   "dottle-nouveau-pavilion-tights-furze",
      )
      new_project = user.projects.build(
        name: "TestProject",
      )

      new_project.valid?
      expect(new_project.errors[:name]).to include("has already been taken")
    end

    it "異なるユーザーのプロジェクト名の重複は許可すること" do
      user = User.create(
        first_name: "Joe",
        last_name:  "Tester",
        email:      "joetester@example.com",
        password:   "dottle-nouveau-pavilion-tights-furze",
      )

      user.projects.create(
        name: "Test Project",
      )

      other_user = User.create(
        first_name: "Jane",
        last_name:  "Tester",
        email:      "janetester@example.com",
        password:   "dottle-nouveau-pavilion-tights-furze",
      )
      other_project = other_user.projects.build(
        name: "Test Project",
      )
      expect(other_project).to be_valid
    end
  end

  describe "期日の検証" do
    it "締切日が過ぎていれば遅延していること" do
      project = FactoryBot.create(:project, :due_yesterday)
      expect(project).to be_late
    end 

    it "締切が今日ならスケジュールどおりであること" do
      project = FactoryBot.create(:project, :due_today)
      expect(project).to_not be_late
    end

    it "締切が未来であればスケジュールどおりであること" do
      project = FactoryBot.create(:project, :due_tomorrow)
      expect(project).to_not be_late
    end
  end

  describe "tarait コールバックの検証" do
    it "projectに対して5つのnoteが紐づいていること" do
      project = FactoryBot.create(:project, :with_notes)

      expect(project.notes.length).to eq 5
    end
  end
  # バリデーションの検証に対して、テスト書ことしたけど nul を許容していたのでスキップ
  # describe Project, type: :model do
  #   it "バリデーションの検証" do
  #     user = Usser.new(
  #     first_name: "Joe",
  #     last_name:  "Tester",
  #     email:      "joetester@example.com",
  #     password:   "dottle-nouveau-pavilion-tights-furze",
  #     )
  #   end
  # end

end