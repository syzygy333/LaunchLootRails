class ResultsController < ApplicationController
  def index
    @pg_search_documents = PgSearch.multisearch(params[:q])
  end
end
