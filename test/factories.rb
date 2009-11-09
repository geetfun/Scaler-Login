Factory.define :user, :class => "user" do |u|
  u.email "user@test.com"
  u.password "secret123"
  u.password_confirmation "secret123"
end