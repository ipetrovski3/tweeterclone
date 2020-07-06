FactoryBot.define do
  factory :tweet do
    user
    
    title { 'Learning rails' }
  end

end