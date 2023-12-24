require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    # factory_botが動いているか確認
    it "has a valid factory" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end

  it "姓、名、メール、パスワードがあれば有効であること" do
    user = User.new(
      first_name: "Aaron",
      last_name: "Sumner",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    expect(user).to be_valid
  end
  it "名がなければ無効であること" do
    # user = User.new(
    #   first_name: nil,
    #   last_name: "Sumner",
    #   email: "tester@example.com",
    #   password: "dottle-nouveau-pavilion-tights-furze"
    # )
    user = FactoryBot.build(:user, first_name: nil)
    expect(user).to be_invalid
  end
  it "姓がなければ無効であること" do
    # user = User.new(last_name: nil)
    user = FactoryBot.build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end
  it "メールがなければ無効であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  it "重複したメールならば無効であること" do
    # 事前にユーザー生成
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  it "ユーザーのフルネームを文字列として返すこと" do
    user = FactoryBot.build(:user, first_name: "John", last_name: "Doe")
    expect(user.name).to eq "John Doe"
  end
end
