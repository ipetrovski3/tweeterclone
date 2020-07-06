FactoryBot.define do
  factory :comment do
    user
    tweet
    
    body { 'Learning rails' }
  end

end