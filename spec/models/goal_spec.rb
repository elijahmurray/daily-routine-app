require 'spec_helper'

describe Goal do

  describe "validation" do
    before do
      @goal = Goal.new()
    end
    
    it "should not be valid without a name" do
      @goal.update(duration: 3, category: "Foobar")
      expect(@goal).not_to be_valid
    end
    
    it "should not be valid without a duration" do
      @goal.update(name: "Goal", category: "Foobar")
      expect(@goal).not_to be_valid
    end
    
    it "should not be valid without a name" do
      @goal.update(name: "Goal", duration: 3)
      expect(@goal).not_to be_valid
    end
  end

  describe ".due_date" do
    context "given a 3 month duration" do
      it "returns a due date 3 months from now" do
        @goal = Goal.new(name: "Test Goal", duration: 3, category: "Personal")
        @goal.save
        expect(@goal.due_date).to eql(@goal.created_at + 3.months)
      end
    end
  end
end
