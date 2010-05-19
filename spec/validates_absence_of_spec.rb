require File.dirname(__FILE__) + '/spec_helper'

describe "ValidatesAbsenceOf" do
  it "should save in a simple case" do
    class Pie < ActiveRecord::Base
      validates_absence_of :reason_deactivated, :if => "active"
    end
    
    Pie.new.save.should be_true
  end
  
  it "should raise if there is no :if option" do
    lambda{
      class Pie < ActiveRecord::Base
        validates_absence_of :reason_deactivated
      end
    }.should raise_error(ArgumentError)
  end
  
  it "should not save if the condition is met" do
    class Pie < ActiveRecord::Base
      validates_absence_of :reason_deactivated, :if => "active"
    end
    
    Pie.new(:reason_deactivated => "pie").save.should be_false
  end

  it "should save if the condition is not met" do
    class Pie < ActiveRecord::Base
      validates_absence_of :reason_deactivated, :if => "active"
    end

    Pie.new(:active => false, :reason_deactivated => "pie").save.should be_true
  end

  it "should pass through the message" do
    class Pie < ActiveRecord::Base
      validates_absence_of :reason_deactivated, :if => "active", :message => "should be empty!"
    end

    p = Pie.new(:reason_deactivated => "pie")
    p.save
    p.errors.full_messages.last.should == "Reason deactivated should be empty!"
  end
end
