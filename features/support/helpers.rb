module TranslatorHelpers
  def translator_mllp_port
    YAML.load_file('config/app_under_test.yml')['translator_mllp_port'].to_i
  end
  def translator_mllp_host
    host = YAML.load_file('config/app_under_test.yml')['translator_mllp_host']
    host ? host : $application.service_host
  end

  def translator_mllp_timeout
    timeout = YAML.load_file('config/app_under_test.yml')['translator_mllp_timeout']
    timeout ? timeout : 30000
  end
end
World(TranslatorHelpers)
