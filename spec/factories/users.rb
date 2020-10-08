FactoryBot.define do

  factory :user do
    nick_name { 'furima' }
    email { 'sample@gmail.com' }
    password { 'aaaa1111' }
    encrypted_password { 'aaaa1111' }
    family_name { '山田' }
    name { '太郎' }
    family_name_show { 'ヤマダ' }
    name_show { 'タロウ' }
    birthday { '2000-12-12' }

  end
end