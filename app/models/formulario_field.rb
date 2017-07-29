require 'net/http'
class FormularioField < ActiveRecord::Base
  belongs_to :field_type
  belongs_to :formulario
  has_many :answers, dependent: :destroy

  def file_field?
    %w[Assinatura Audio Arquivo Vídeo Foto].include? field_type.nome
  end

  def arquivo_field?
    %w[Arquivo].include? field_type.nome
  end

  def assinatura_field?
    %w[Assinatura].include? field_type.nome
  end

  def audio_field?
    %w[Audio].include? field_type.nome
  end

  def video_field?
    %w[Vídeo].include? field_type.nome
  end

  def foto_field?
    %w[Assinatura Foto].include? field_type.nome
  end

  def multi_picture_field?
    %w[MultiPictures].include? field_type.nome
  end

  def coordenada_field?
    %w[Coordenadas].include? field_type.nome
  end

  def xml_field
    response = get_url_options

    if valid_json?(response)
      response
    elsif Nokogiri::XML(response).errors.empty?
     Hash.from_xml(response).to_json
    end
  end

  def get_url_options
    request_url = URI.parse(url)
    req = Net::HTTP::Get.new(request_url.to_s)

    res = Net::HTTP.start(request_url.host, request_url.port, use_ssl: request_url.scheme == 'https') {|http|
      http.request(req)
    }
    res.body
  end

  def valid_json?(json)
    JSON.parse(json)
    return true
  rescue JSON::ParserError => e
    return false
  end

end
