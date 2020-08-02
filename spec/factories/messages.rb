FactoryBot.define do
  factory :message do
    subject { "" }
    content { "MyText" }
    receiver { 1 }
    sender { 1 }
  end
end
