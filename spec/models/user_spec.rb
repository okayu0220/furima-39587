require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての項目で正しい値が存在すれば保存できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない場合' do
      it 'nicknameが空では保存できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では保存できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailでは保存できない' do
        @user.save
        user2 = FactoryBot.build(:user, email: @user.email)
        user2.valid?
        expect(user2.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれていないと保存できない' do
        @user.email = "testemail"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では保存できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では保存できない' do
        @user.password = "test1"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では保存できない' do
        @user.password = Faker::Alphanumeric.alpha(number: 69) + Faker::Number.number(digits: 60).to_s
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordが英字のみでは保存できない' do
        @user.password = "testpassword"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみでは保存できない' do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordに全角文字が含まれると保存できない' do
        @user.password += "Ａ"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが一致しないと保存できない' do
        @user.password = "test1234"
        @user.password_confirmation = "test5678"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_name_fwが空では保存できない' do
        @user.first_name_fw = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name fw can't be blank")
      end
      it 'first_name_fwに全角の漢字・ひらがな・カタカナ以外が含まれると保存できない' do
        @user.first_name_fw += "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name fw is invalid")
      end
      it 'last_name_fwが空では保存できない' do
        @user.last_name_fw = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name fw can't be blank")
      end
      it 'last_name_fwに全角の漢字・ひらがな・カタカナ以外が含まれると保存できない' do
        @user.last_name_fw += "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name fw is invalid")
      end
      it 'first_name_knが空では保存できない' do
        @user.first_name_kn = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kn can't be blank")
      end
      it 'first_name_knに全角カタカナ以外が含まれると保存できない' do
        @user.first_name_kn += "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kn is invalid")
      end
      it 'last_name_knが空では保存できない' do
        @user.last_name_kn = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kn can't be blank")
      end
      it 'last_name_knに全角カタカナ以外が含まれると保存できない' do
        @user.last_name_kn += "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kn is invalid")
      end
      it 'birthdayが空では保存できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
