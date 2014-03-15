class TranslateController < ApplicationController
  # GET /translate
  # GET /translate.json
  def index
    @translates = Translate.all
  end

  # GET /translate/:service/:from-:to/:term
  # GET /translate/:service/:from-:to/:term.json
  def show
    service = TranslationService.find_by(name: params[:service])

    if service == nil then
      redirect_to raise ActionController::RoutingError.new("Service #{params[:service]} not found")
    end

    languages = service.translation_service_languages.find_by(
        source_language: params[:from],
        target_language: params[:to])

    if languages == nil then
      redirect_to raise ActionController::RoutingError.new("Service #{params[:service]} cannot translate from #{params[:from]} to #{params[:to]}")
    end

    entry = TermRequest.new(
        term: params[:term],
        source_language: languages.source_language,
        target_language: languages.target_language,
        service: service.name)

    entry.save

    formattedUrl = service.url
      .sub('{term}', entry.term)
      .sub('{from}', languages.source_language)
      .sub('{to}', languages.target_language)

    url = URI.parse(formattedUrl)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http| http.request(req) }

    body = Nokogiri::HTML::Document.parse(res.body)
    data = body.css('div.js-article-lingvo')
    data.each do |node|
      puts node
    end

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def translate_params
      params[:translate]
    end
end
