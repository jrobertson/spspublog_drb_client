#!/usr/bin/env ruby

# file: spspublog_drb_client.rb

require 'drb'


class SPSPubLogDRbClient

  def initialize(host: '127.0.0.1', port: '90900')

    DRb.start_service
    
    @log = DRbObject.new nil, "druby://#{host}:#{port}"

  end

  def info(s)
    @log.info s
  end

  def debug(s)
    @log.debug s
  end

end

