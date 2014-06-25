FactoryGirl.define do
  factory :peter, class: Target do
    name "Peter Wong"
    domain "alphasights.com"
    initialize_with { new(name, domain) }
  end

  factory :craig, class: Target do
    name "Craig Silverstein"
    domain "google.com"
    initialize_with { new(name, domain) }
  end

  factory :steve, class: Target do
    name "Steve Wozniak"
    domain "apple.com"
    initialize_with { new(name, domain) }
  end

  factory :barack, class: Target do
    name "Barack Obama"
    domain "whitehouse.gov"
    initialize_with { new(name, domain) }
  end
end
