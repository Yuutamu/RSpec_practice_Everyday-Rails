require 'rails_helper'

RSpec.describe User, type: :model do
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
    user = User.new(
      first_name: nil,
      last_name: "Sumner",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    expect(user).to be_invalid
  end
  it "姓がなければ無効であること" do
    user = User.new(last_name: nil)
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
    User.create(
      first_name:  "Joe",
      last_name:  "Tester",
      email:      "tester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
    user = User.new(
      first_name:  "Joe",
    last_name:  "Tester",
    email:      "tester@example.com",
    password:   "dottle-nouveau-pavilion-tights-furze",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")  
  end
  it "ユーザーのフルネームを文字列として返すこと"
end