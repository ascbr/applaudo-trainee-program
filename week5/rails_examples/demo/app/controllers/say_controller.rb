class SayController < ApplicationController
  def hello
    @time = Time.zone.know
  end

  def goodbye
  end
end
