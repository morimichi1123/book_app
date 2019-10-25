require 'rails_helper'

RSpec.feature "page_move", type: :feature do

  before do
      @user = FactoryBot.create(:user)
  end

  feature 'home page' do
    before do
      visit root_path
    end

    it 'homeにWelcome to MMs Book Appの文字が現れる' do
      expect(page).to have_content "Welcome to MM's Book App"
    end

    it 'title have Book App' do
      expect(page).to have_title "Book App"
    end
  end

  feature 'signup page' do
    before do
      visit signup_path
    end

    it 'Sign up文字が現れる' do
      expect(page).to have_content "Sign up"
    end

    it 'title have MMs Book App' do
      expect(page).to have_title "Sign up | MM's Book App"
    end

    it 'ボタンのCreate my accountがある' do
      expect(page).to have_button "Create my account"
    end

    feature 'new createした時の挙動' do
      before do
        fill_in 'Name',         with: 'hoge'
        fill_in 'Email',        with: 'hoge@hoge.com'
        fill_in 'Password',     with: 'hogehoge'
        fill_in 'Confirmation', with: 'hogehoge'
        click_button 'Create my account'
      end

      it 'list_pathに遷移する' do
        expect(current_path).to eq list_path
      end

      it "成功するとメッセージがでる=>'Welcome to Welcome to MM's Book App!'" do
        expect(page).to have_content "Welcome to MM's Book App!"
      end
    end

    feature 'new createに失敗した時の挙動テスト' do
      before do
        fill_in 'Name',         with: 'hoge'
        fill_in 'Email',        with: 'test@hoge.com'
        fill_in 'Password',     with: 'hogehoge'
        fill_in 'Confirmation', with: 'fugafuga'
        click_button 'Create my account'
      end

      it 'sign_pathに遷移する' do
        expect(current_path).to eq signup_path
      end


      it "passwordが違うとエラーメッセージがでる" do
        expect(page).to have_content "The form contains 1 error."
        expect(page).to have_content  'doesn\'t match'
      end
    end
  feature "ログイン失敗" do
    before do
      @user = FactoryBot.create(:user)
      visit login_path
      fill_in 'Email',        with: 'tester1@example.com'
      fill_in 'Password',     with: 'passwordd'
      click_button 'Log in'
    end
    it "error message" do
      expect(page).to have_content "Invalid email/password combination"
    end


  end
  # feature "ログイン成功" do
  #   before do
  #     @user = FactoryBot.create(:user)
  #     visit login_path
  #     fill_in 'Email',        with: 'tester1@example.com'
  #     fill_in 'Password',     with: 'password'
  #     click_button 'Log in'
  #   end
  #   it "成功時のもの" do
  #     expect(page).to have_content "Log out"
  #   end


  # end

#イレギュラーケースを考える
#削除・更新のテスト
feature "ログインユーザはeditへ行ける" do
  before do
    @user = FactoryBot.create(:user)
    # FactoryBot.create(:book, title: "hoga", author: "hu", publisher: "he", genre: "ga")
    @book = FactoryBot.create(:book)
    visit signup_path
    # visit login_path
    # fill_in 'Email',        with: 'tester1@example.com'
    # fill_in 'Password',     with: 'password'
    # click_button 'Log in'
      fill_in 'Name',         with: 'hoge'
      fill_in 'Email',        with: 'hoge@hoge.com'
      fill_in 'Password',     with: 'hogehoge'
      fill_in 'Confirmation', with: 'hogehoge'
      click_button 'Create my account'
    visit list_path
    visit edit_book_path(@book.id)
  end

  it "edit page にとべる" do
    expect(page).to have_content "Update Book Information"
  end

end
end

feature "ログインユーザはdeleteへ行ける" do
  before do
    @user = FactoryBot.create(:user)
    # FactoryBot.create(:book, title: "hoga", author: "hu", publisher: "he", genre: "ga")
    @book = FactoryBot.create(:book)
    visit signup_path
    # visit login_path
    # fill_in 'Email',        with: 'tester1@example.com'
    # fill_in 'Password',     with: 'password'
    # click_button 'Log in'
      fill_in 'Name',         with: 'hoge'
      fill_in 'Email',        with: 'hoge@hoge.com'
      fill_in 'Password',     with: 'hogehoge'
      fill_in 'Confirmation', with: 'hogehoge'
      click_button 'Create my account'
    visit list_path
    visit book_path(@book.id)
    click_link 'delete'
  end

  it " confirmせずに本がdeeteされること" do
    # expect(page.driver.browser.switch_to.alert.text).to eq "You sure?"
    # link = find('You sure\?')
    expect(page).to have_content 'Book deleted'

  end

end




end