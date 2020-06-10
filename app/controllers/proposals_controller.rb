class ProposalsController < ApplicationController
  def index
    @user = User.all
  end
end
