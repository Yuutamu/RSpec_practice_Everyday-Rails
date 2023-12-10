require 'rails_helper'

RSpec.describe Note, type: :model do
  it "factory で関連付けられたデータが生成されているか検証" do
    note = FactoryBot.create(:note)
    puts "This note's project is #{note.project.inspect}"
    puts "This note's user is #{note.user.inspect}"
  end

  # describe "文字列二一致する message を検索する" do
  #   before do
  #     @user = User.create(
  #       first_name:  "Joe",
  #       last_name:  "Tester",
  #       email:      "tester@example.com",
  #       password:   "dottle-nouveau-pavilion-tights-furze",
  #     )

  #     @project = @user.projects.create(
  #       name: "Test Project"
  #     )

  #     @note1 = @project.notes.create(
  #       message: "This is the first note.",
  #       user: @user,
  #     )

  #     @note2 = @project.notes.create(
  #       message: "This is the second note.",
  #       user: @user,
  #     )

  #     @note3 = @project.notes.create(
  #       message: "First, preheat the oven.",
  #       user: @user,
  #     )
  #   end

  #   context "一致するデータが見つかるとき" do
  #     it "search term(検索語)と等しい note を返すこと" do
  #       expect(Note.search("first")).to include(@note1, @note3)
  #       expect(Note.search("first")).to_not include(@note2)
  #     end
  #   end

  #   context "一致するデータが１件も見つからないとき" do
  #     it "検索結果が１件も見つからなければからのコレクションを返すこと" do
  #       expect(Note.search("message")).to be_empty
  #     end
  #   end
  # end
end