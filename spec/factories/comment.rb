FactoryBot.define do
  factory :commnet do
    content { "MyComment" }
    assosiation { :article }
  end
end