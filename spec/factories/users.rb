FactoryBot.define do

  factory :user do
    nick_name { 'furima' }
    email { 'sample@gmail.com' }
    password { 'aaaa1111' }
    encrypted_password {aaaa1111}
    familyname { '山田' }
    name { '太郎' }
    family_name_show { 'ヤマダ' }
    name_show { 'タロウ' }
    birthday { '1' }

  end
end