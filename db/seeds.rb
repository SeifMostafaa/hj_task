require 'faker'

50.times do
  Article.create(
    title: Faker::Quote.robin,
    body: Faker::Lorem.paragraph(sentence_count: 100)
  )
end