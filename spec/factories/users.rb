FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email {Faker::Internet.free_email}
    password { '01234kina' }
    password_confirmation { password }
    f_name { '山田' }
    l_name { '太郎' }
    f_name_kana { 'ヤマダ' }
    l_name_kana { 'タロウ' }
    birthday { '1989-07-08' }
  end
end
