class RubygemsController < ApplicationController
  before_action :set_rubygem, only: :show

  # GET /rubygems
  # GET /rubygems.json
  def index
    @rubygems = Rubygem.page(params[:page]).per(100).order(:id)
  end

  # GET /rubygems/1
  # GET /rubygems/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rubygem
      @rubygem = Rubygem.find(params[:id])
    end
end
