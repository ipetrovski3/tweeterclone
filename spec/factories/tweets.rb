FactoryBot.define do
  factory :tweet do
    user

    title { 'Learning rails' }
    body { 'Testing body' }
  end
end
