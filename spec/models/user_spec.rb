require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname、email、password、password_confirmation、last_name、first_name、last_kana、first_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_name:全角(漢字,ひらがな,カタカナ)のみ' do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it 'first_name:全角(漢字,ひらがな,カタカナ)のみ' do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it 'last_kana:全角カタカナのみ' do
        @user.last_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid. Input fullwidth katakana characters.")
      end
      it 'first_kana:全角カタカナのみ' do
        @user.first_kana = "ｱｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid. Input fullwidth katakana characters.")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
