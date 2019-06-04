require 'spec_helper'

RSpec.shared_examples "pieces" do

  it "should have attribute: color" do
    expect(piece).to have_attribute :color
  end

  it "should initialize successfully as an instance of the described class" do
    expect(king).to be_a_kind_of Piece
  end

end

# RSpec.describe king do
#   it_behaves_like "piece"
# end