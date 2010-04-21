require File.dirname(__FILE__) + '/spec_helper'

describe "Train-style mocking" do
  def train_mock(starting_object, method_string)
    methods = method_string.split('.').map(&:to_sym)
    curr_mock = starting_object
    methods.each_with_index do |method, i|
      expectation = curr_mock.expects(method).once
      
      return expectation if i+1 == methods.size
      
      next_mock = mock
      expectation.returns(next_mock)
      curr_mock = next_mock
    end
  end
  
  it "should allow mocking LoD violations with train_mock" do
    car = "foo"
    train_mock(car, 'chassis.axle.universal_joint.cog.turn').returns(:ok)
    car.chassis.axle.universal_joint.cog.turn.should == :ok
  end
end

