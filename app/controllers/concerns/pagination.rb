module Pagination
  extend ActiveSupport::Concern

  # @page = params[:page] || 1
  # @per_page = params[:per_page] || 9

  def limits
    [ 9, 15, 30 ]
  end

  def offset
    params[:page].nil? ? 0 * limit : (params[:page].to_i - 1) * limit
  end

  def limit
    puts limits.include?(params[:per_page].to_i)
    limits.include?(params[:per_page].to_i) ? params[:per_page].to_i : limits[0]
  end
end
