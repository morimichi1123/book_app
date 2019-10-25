require 'rails_helper'

RSpec.describe UsersController, type: :controller do
 describe "get new できるかどうか" do
   it "returns http success" do
     get :new
     expect(response).to have_http_status(:success)
   end
 end

 #これはfeatureでやっているのとほぼ一緒
 #feature "ログインしてる" do
 #  before do
 #      @user = FactoryBot.create(:user)
 #      visit login_path
 #      fill_in 'Email',        with: 'hoge@hoge.com'
 #      fill_in 'Password',     with: 'hogehoge'
 #      click_button 'Log in'
 #  end

 #  it "returns http success" do
 #    expect(response).to have_http_status(:success)
 #  end
 #end
end