require './test/test_helper'

class ModelTest < Minitest::Test
  def test_exists
    assert Edmunds::Vehicle::Specification::Model::Model
  end

  def test_model
    VCR.use_cassette('model') do
      model = Edmunds::Vehicle::Specification::Model::Model.find("honda", "accord")
      assert_equal Edmunds::Vehicle::Specification::Model::Model, model.class

      # Check that the fields are accessible by our model
      assert_equal "Honda_Accord", model.id
      assert_equal "Accord", model.name
      assert_equal 26, model.years.count
    end
  end
end