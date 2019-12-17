require 'rails_helper'

RSpec.describe Headhunter, type: :model do
  it "name is required" do
    expect(Headhunter.new(name: nil).valid?).to eq false
  end
end
