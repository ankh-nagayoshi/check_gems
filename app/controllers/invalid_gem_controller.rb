class InvalidGemController < ApplicationController
  before_action :set_dangerous_gems, only: [:by_lockfile, :by_list]
  
  def by_lockfile
  end

  def by_list
  end
  
  private
    def set_dangerous_gems
      @dangerous_gems = if params[:lockfile]
        parsed_lockfile = Bundler::LockfileParser.new(params[:lockfile].read)
        InvalidGem.by_lockfile(parsed_lockfile)
      elsif params[:gemlist]
        gemlist = GemList.parse(params[:gemlist])
        InvalidGem.by_list(gemlist)
      else
        []
      end
    end
end
