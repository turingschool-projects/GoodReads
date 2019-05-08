require 'rails_helper'

describe User do
  describe "validations" do
    it { should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many(:books).through(:reviews)}
  end
end
