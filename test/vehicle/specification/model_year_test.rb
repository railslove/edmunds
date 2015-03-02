require './test/test_helper'

class ModelYearTest < Minitest::Test
  def test_exists
    assert Edmunds::Vehicle::Specification::ModelYear::ModelYear
  end

  def test_model_year
    VCR.use_cassette('model_year') do
      model_year = Edmunds::Vehicle::Specification::ModelYear::ModelYear.find("honda", "accord", 2013)
      assert_equal Edmunds::Vehicle::Specification::ModelYear::ModelYear, model_year.class

      # Check that the fields are accessible by our model
      assert_equal 100537293, model_year.id
      assert_equal 2013, model_year.year
      assert_equal 21, model_year.styles.count
    end
  end
end