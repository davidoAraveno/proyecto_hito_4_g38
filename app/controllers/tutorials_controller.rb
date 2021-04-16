class TutorialsController < ApplicationController
  def index
    
    @tutorials = Tutorial.all
    @califications = Star.all
  end
end
