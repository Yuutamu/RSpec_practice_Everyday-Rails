# カピバラ環境設定 p115
RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless # _headless の記述をなくすとテストのたびにクロームが立ち上がる
  end
end
