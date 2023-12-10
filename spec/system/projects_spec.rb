require 'rails_helper'

RSpec.describe "Project", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "ユーザーが新しいプロジェクトを作成すること" do
    user = FactoryBot.create(:user)
  
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    # この時点でログイン完了
  
    expect {
      click_link "New Project"
      fill_in "Name", with: "Test Project"
      fill_in "Description", with: "Tryinng out Capybara"
      click_button "Create Project"
      # この時点でプロジェクトを作成したということを再現（expect ブロックの外に出しても良さそうだが？）
  
      expect(page).to have_content "Project was successfully created"
      expect(page).to have_content "Test Project"
      expect(page).to have_content "Owner: #{user.name}"
    }.to change(user.projects, :count).by(1)
  end

    # Launchy gemの動作確認
  # scenario "[失敗]ゲストがプロジェクトを作成すること" do
  #   visit projects_path
  #   save_and_open_page
  #   click_link "New Project"
  # end
end

