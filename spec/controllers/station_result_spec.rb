require 'rails_helper'

RSpec.describe StationResultsController do
  describe " GET new " do
    it "renders the page" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "#calculate_mark" do
    it "calculates a mark" do
      @station_result = StationResult.new
      @station_result.write_attribute(:mark, 0)
      #mock_station_result = double('station_result', mark: 0)
      @station_result.instance_eval{ calculate_mark }
      @station_result.instance_eval{ @calculate_mark }.should eql 0
    end
  end
end
