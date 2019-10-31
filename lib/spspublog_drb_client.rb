  #!/usr/bin/env ruby

# file: spspublog_drb_client.rb

require 'drb'


class SPSPubLogDRbClient
  
  
  module Severity
    # Low-level information, mostly for developers.
    DEBUG = 0
    # Generic (useful) information about system operation.
    INFO = 1
    # A warning.
    WARN = 2
    # A handleable error condition.
    ERROR = 3
    # An unhandleable error that results in a program crash.
    FATAL = 4
    # An unknown message that should always be logged.
    UNKNOWN = 5
  end  
  
  DEBUG   = Severity::DEBUG
  INFO    = Severity::INFO
  WARN    = Severity::WARN
  ERROR   = Severity::ERROR
  FATAL   = Severity::FATAL
  UNKNOWN = Severity::UNKNOWN
  

    
  attr_accessor :level
  
  def initialize(host: '127.0.0.1', port: '9090', level: Severity::DEBUG)

    DRb.start_service
    
    @log = DRbObject.new nil, "druby://#{host}:#{port}"
    @log.level = level

  end

  def debug(s)
    @log.debug s
  end    

  def error(s)
    @log.error s
  end  

  def fatal(s)
    @log.fatal s
  end  
  
  def info(s)
    @log.info s
  end  
  
  def level()
    @log.level
  end
  
  def level=(val)
    @log.level = set_level val
  end

  private
  
  def set_level(level)
    
    if level.is_a? Symbol then
      %i(debug info warn error fatal unknown).zip(0..5).to_h[level]
    else
      level
    end    
    
  end  

end

