require 'spec_helper'

describe Client do
  it "fails validation with no name" do
    Client.new.should have(1).errors_on(:name)
  end

  it "fails validation with no status" do
    Client.new.should have(1).errors_on(:status)
  end

  context "with an existing client with the same name" do
    before(:each) do
      client = Client.create(:name => 'test', :status => 'Good')
    end

    it "fails validation with error on name" do
      Client.new(:name => 'test', :status => 'test').should have(1).errors_on(:name)
    end
  end
end
