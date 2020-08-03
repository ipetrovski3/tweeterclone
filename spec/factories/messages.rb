FactoryBot.define do
  factory :message do
    body { "MyText" }
    conversation { "" }
    user { "" }
    read { false }
  end
end
