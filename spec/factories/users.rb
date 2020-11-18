FactoryBot.define do
  factory :user do
    nickname   {"test"}
    email                 {"test@example"}         
    password              {"a000000"}
    password_confirmation {password}
    last_name_kanji   {"佐竹"}
    first_name_kanji  {"元気"}
    last_name  {"サタケ"}
    first_name {"ゲンキ"}
    birthday  {"2007-05-05"}
  end
end