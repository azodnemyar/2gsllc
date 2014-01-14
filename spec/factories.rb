FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    username    "exampleuser"
    password "foobar"
    password_confirmation "foobar"
  end
end