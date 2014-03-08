require 'spec_helper'

describe Settings do
  context "variable of allowed types can be saved to any name" do
    it "should save string" do
      Settings.email = "jhon@snow.com"
      Settings.email.should == "jhon@snow.com"  
    end
    it "should save integer" do
      Settings.number = 135
      Settings.number.should == 135
    end
    it "should save float" do
      Settings.number = 135.1
      Settings.number.should == 135.1
    end
    it "should save boolean" do
      Settings.true_value = true
      Settings.true_value.should == true

      Settings.false_value = false
      Settings.false_value.should == false
    end
    it "shouldn't save any other types" do
      Settings.hash_val = {}
      Settings.hash_val.should == nil

      Settings.symbol_val = :uno
      Settings.symbol_val.should == nil

      Settings.array_val = []
      Settings.array_val.should == nil
    end
  end
  context "saved values can be changed" do
    before :each do
      Settings.email = "jhon@snow.com"
      Settings.number = 135
      Settings.true_value = true
    end
    it "should change value if allowed type" do
      Settings.email = true
      Settings.email.should == true

      Settings.number = "dos"
      Settings.number.should == "dos"

      Settings.true_value = 10
      Settings.true_value.should == 10
    end
    it "shouldn't change value to unallowed type" do
      Settings.email = []
      Settings.email.should == "jhon@snow.com"

      Settings.number = {}
      Settings.number.should == 135

      Settings.true_value = :false
      Settings.true_value.should == true
    end
  end
end
